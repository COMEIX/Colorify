// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers
import 'dart:io';
import 'dart:math';
import 'package:colorify/backend/io/generator/generator.dart';
import 'package:colorify/backend/providers/blocks_arg_provider.dart';
import 'package:colorify/backend/structure/structure.dart';
import 'package:colorify/palette.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;
import 'package:vector_math/vector_math.dart';

class BlockGenerator extends Generator {
  late dynamic args;
  late double samplingRate;
  late int generationPlane;
  late bool allowSand;
  late bool allowGlass;
  late bool useStructure;

  @override
  BlockGenerator(this.args);

  @override
  Future<void> checkArgs() async {
    final _args = args as ToBlocksArgProvider;
    final String sr = _args.samplingRate.text;

    final double _sr = sr.isEmpty ? 0.3 : double.tryParse(sr) as double;
    final int _gp = _args.generationPlane;
    final bool _als = _args.allowSand == AllowSand.allow;
    final bool _alg = _args.allowGlass == AllowGlass.allow;
    final bool _us = _args.useStruct == UseStructure.use;

    if (!(_sr > 0 && _sr <= 1)) {
      throw Exception("Invalid sampling rate");
    }

    if (!([0, 1, 2].contains(_gp))) {
      throw Exception("Invalid generation plane");
    }

    samplingRate = _sr;
    generationPlane = _gp;
    allowSand = _als;
    allowGlass = _alg;
    useStructure = _us;
  }

  @override
  Future<dynamic> generate(Directory saveDir, bool arch) async {
    await checkArgs();

    late Directory outputDir;
    if (arch) {
      if (useStructure) {
        outputDir = Directory(path.join(saveDir.path, 'output/structures/colorify'));
      } else {
        outputDir = Directory(path.join(saveDir.path, 'output/functions'));
      }
    } else {
      outputDir = saveDir;
    }

    final pick = await FilePicker.platform.pickFiles(type: FileType.image);

    // ! Error
    if (pick == null) {
      throw Exception("No file is selected");
    }

    final filePath = pick.files.single.path ?? '';
    final image = File(filePath);
    final bytes = await image.readAsBytes();
    final decodedImage = img.decodeImage(bytes);

    // ! Error
    if (decodedImage == null) {
      throw Exception("Null image");
    }

    // Args
    final width = decodedImage.width;
    final height = decodedImage.height;
    final step = 1 / samplingRate;

    // Image traversal
    int posX = 1;
    int posY = 1;
    int maxX = 0;
    int maxY = 0;
    List<List<dynamic>> blocks = [];
    for (int x = 0; x < width; x += step.toInt()) {
      for (int y = 0; y < height; y += step.toInt()) {
        final pixel = decodedImage.getPixel(x, y);
        final r = img.getRed(pixel);
        final g = img.getGreen(pixel);
        final b = img.getBlue(pixel);

        double minDistance = double.infinity;
        late String closestBlockTypeId;
        for (final color in palette) {
          if (!allowSand && color['name'].contains('sand')) {
            continue;
          }
          if (!allowGlass && color['name'].contains('glass')) {
            continue;
          }
          final rgb = color['rgb'] as List<int>;
          final distance = pow(rgb[0] - r, 2) + pow(rgb[1] - g, 2) + pow(rgb[2] - b, 2);

          if (distance >= minDistance) {
            continue;
          }

          closestBlockTypeId = color['name'];
          minDistance = distance.toDouble();
        }

        blocks.add([posX, posY, closestBlockTypeId]);

        posY++;
        if (posY > maxY) {
          maxY = posY;
        }
      }
      posY = 1;
      posX++;
      if (posX > maxX) {
        maxX = posX;
      }
    }

    // Differs
    late final Structure struct;
    StringBuffer str = StringBuffer();

    if (useStructure) {
      if (generationPlane == 0) {
        struct = Structure(Vector3(maxX.toDouble(), maxY.toDouble(), 1));
      } else if (generationPlane == 1) {
        struct = Structure(Vector3(1, maxX.toDouble(), maxY.toDouble()));
      } else {
        struct = Structure(Vector3(maxX.toDouble(), 1, maxY.toDouble()));
      }
    }

    // Collect
    int lineIndex = 0;
    int fileIndex = 0;
    for (final block in blocks) {
      if (useStructure) {
        if (generationPlane == 0) {
          struct.setBlock(
              Vector3(
                  maxX.toDouble() - block[0].toDouble(), maxY.toDouble() - block[1].toDouble(), 1),
              block[2]);
        } else if (generationPlane == 1) {
          struct.setBlock(
              Vector3(
                  1, maxX.toDouble() - block[0].toDouble(), maxY.toDouble() - block[1].toDouble()),
              block[2]);
        } else {
          struct.setBlock(
              Vector3(
                  maxX.toDouble() - block[0].toDouble(), 1, maxY.toDouble() - block[1].toDouble()),
              block[2]);
        }
      } else {
        // Split
        if (lineIndex >= 10000) {
          final savePath = path.join(outputDir.path, 'output$fileIndex.mcfunction');
          final outputFile = File(savePath);
          await outputFile.writeAsString(str.toString());
          str = StringBuffer();
          lineIndex = 0;
          fileIndex++;
        }
        if (generationPlane == 0) {
          str.write(
              "setblock ~${maxX.toDouble() - block[0]} ~${maxY.toDouble() - block[1]} ~0 ${block[2]}\n");
        } else if (generationPlane == 1) {
          str.write(
              "setblock ~0 ~${maxX.toDouble() - block[0]} ~${maxY.toDouble() - block[1]} ${block[2]}\n");
        } else {
          str.write(
              "setblock ~${maxX.toDouble() - block[0]} ~0 ~${maxY.toDouble() - block[1]} ${block[2]}\n");
        }
        lineIndex++;
      }
    }

    // Write file
    if (useStructure) {
      struct.writeFile(path.join(outputDir.path, 'output.mcstructure'));
    } else {
      final savePath = path.join(outputDir.path, 'output$fileIndex.mcfunction');
      final outputFile = File(savePath);
      await outputFile.writeAsString(str.toString());
    }

    // Return size for tickingarea later
    if (useStructure) {
      final size = struct.size;
      if (generationPlane == 0) {
        return Vector3(size.x, size.y, 1);
      } else if (generationPlane == 1) {
        return Vector3(1, size.y, size.z);
      } else {
        return Vector3(size.x, 1, size.z);
      }
    } else {
      return fileIndex;
    }
  }
}
