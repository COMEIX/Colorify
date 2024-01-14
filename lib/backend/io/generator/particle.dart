// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, overridden_fields
import 'dart:io';
import 'dart:math';
import 'package:colorify/backend/io/generator/generator.dart';
import 'package:colorify/backend/providers/particles_arg_provider.dart';
import 'package:colorify/backend/util/math.dart';
import 'package:colorify/backend/util/transformer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;

class ParticleGenerator extends Generator {
  late dynamic args;
  late double samplingRate;
  late double particleHeight;
  late String particleTypeId;
  late String targetColor;
  late int generationPlane;
  late bool rot;
  late double rotX;
  late double rotY;
  late double rotZ;

  @override
  ParticleGenerator(this.args);

  @override
  Future<void> checkArgs() async {
    final _args = args as ToParticlesArgProvider;
    final String sr = _args.samplingRate.text;
    final String ph = _args.particleHeight.text;
    final String pti = _args.particleTypeId.text;
    final String tc = _args.targetColor.text;
    final bool rt = _args.rotate == Rotate.y;
    rot = rt;
    final String rx = _args.rotX.text;
    final String ry = _args.rotY.text;
    final String rz = _args.rotZ.text;

    final _sr = sr.isEmpty ? 0.5 : double.tryParse(sr) as double;
    final _ph = ph.isEmpty ? 5.0 : double.tryParse(ph) as double;
    final _pti = pti.isEmpty ? "minecraft:endrod" : pti;
    final _tc = tc.isEmpty ? "#000000" : tc;
    final _gp = _args.generationPlane;
    final _rx = rx.isEmpty ? 0.0 : double.tryParse(rx) as double;
    final _ry = rx.isEmpty ? 0.0 : double.tryParse(ry) as double;
    final _rz = rx.isEmpty ? 0.0 : double.tryParse(rz) as double;

    if (!(_sr > 0 && _sr <= 1)) {
      throw Exception("Invalid sampling rate");
    }

    if (!(_ph > 0)) {
      throw Exception("Invalid particle height");
    }

    if (!([6, 7].contains(_tc.length))) {
      throw Exception("Invalid target color");
    }

    if (!([0, 1, 2].contains(_gp))) {
      throw Exception("Invalid generation plane");
    }

    if (rot && (_rx == 0 && _ry == 0 && _rz == 0)) {
      throw Exception("Invalid rotation vector argument(s)");
    }

    samplingRate = _sr;
    particleHeight = _ph;
    particleTypeId = _pti;
    targetColor = _tc;
    generationPlane = _gp;
    rotX = _rx;
    rotY = _ry;
    rotZ = _rz;
  }

  @override
  Future<int> generate(Directory saveDir, bool arch) async {
    await checkArgs();

    late Directory outputDir;
    if (arch) {
      outputDir = Directory(path.join(saveDir.path, 'output/functions'));
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
    final zoomCoe = particleHeight / height;
    final rgbs = hexToRgb(targetColor);
    final targetR = rgbs[0];
    final targetG = rgbs[1];
    final targetB = rgbs[2];

    var output = StringBuffer();
    var fileIndex = 0;
    var linesCount = 0;
    late File outputFile;

    // * Traversal
    for (int x = 0; x < width; x += step.toInt()) {
      for (int y = 0; y < height; y += step.toInt()) {
        final pixel = decodedImage.getPixel(x, y);
        final r = img.getRed(pixel);
        final g = img.getGreen(pixel);
        final b = img.getBlue(pixel);

        final distance = sqrt(pow(targetR - r, 2) + pow(targetG - g, 2) + pow(targetB - b, 2));

        if (distance > 30) continue;

        final transX = (width / 2 - x) * zoomCoe;
        final transY = (height / 2 - y) * zoomCoe;

        // Write
        late Vector3 roted;
        if (rot) {
          roted = Transformer.rotate(Vector3(transX, 0, transY), Vector3(rotX, rotY, rotZ));
          output.write('particle $particleTypeId ~${roted.x} ~${roted.y} ~${roted.z}\n');
        } else {
          switch (generationPlane) {
            case 0:
              {
                output.write('particle $particleTypeId ~$transX ~$transY ~0\n');
                break;
              }

            case 1:
              {
                output.write('particle $particleTypeId ~0 ~$transX ~$transY\n');
                break;
              }

            case 2:
              {
                output.write('particle $particleTypeId ~$transX ~0 ~$transY\n');
                break;
              }
          }
        }

        // Maximum lines cutting
        linesCount++;
        if (linesCount >= 10000) {
          final savePath = path.join(outputDir.path, 'output$fileIndex.mcfunction');
          outputFile = File(savePath);
          await outputFile.writeAsString(output.toString());

          // Update
          output = StringBuffer();
          linesCount = 0;
          fileIndex++;
        }
      }
    }

    // Rest
    final savePath = path.join(outputDir.path, 'output$fileIndex.mcfunction');
    outputFile = File(savePath);
    await outputFile.writeAsString(output.toString());

    return fileIndex;
  }

  List<int> hexToRgb(String hexColor) {
    if (hexColor.startsWith('#')) {
      hexColor = hexColor.substring(1);
    }

    if (hexColor.length != 6 && hexColor.length != 8) {
      return [];
    }

    int intValue = int.parse(hexColor, radix: 16);

    if (hexColor.length == 6) {
      return [
        (intValue >> 16) & 0xFF,
        (intValue >> 8) & 0xFF,
        intValue & 0xFF,
      ];
    } else {
      return [
        (intValue >> 24) & 0xFF,
        (intValue >> 16) & 0xFF,
        (intValue >> 8) & 0xFF,
        intValue & 0xFF,
      ];
    }
  }
}
