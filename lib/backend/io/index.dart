// ignore_for_file: unused_local_variable, use_build_context_synchronously
import 'dart:io';
import 'package:colorify/components/snackbar.dart';
import 'package:colorify/const.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:colorify/backend/io/archiver.dart';
import 'package:colorify/backend/io/generator/block.dart';
import 'package:colorify/backend/io/generator/particle.dart';
import 'package:colorify/backend/providers/function_provider.dart';
import 'package:colorify/backend/providers/blocks_arg_provider.dart' as block_args_provider;
import 'package:colorify/backend/providers/particles_arg_provider.dart' as particle_args_provider;

void generate(BuildContext context) async {
  if (!(await Permission.manageExternalStorage.isGranted)) {
    ScaffoldMessenger.of(context).showSnackBar(getSnackbar(context, '未授予应用读写权限，请手动授予以便程序正常工作'));
    return;
  }

  final fp = Provider.of<FunctionProvider>(context, listen: false);
  if (fp.selectedFunction == Functions.acknowledgement) {
    return;
  } else if (!implementedFunctions.contains(fp.selectedFunction)) {
    ScaffoldMessenger.of(context).showSnackBar(getSnackbar(context, '都告诉你功能还妹实现，别急啦'));
    return;
  }
  ScaffoldMessenger.of(context).showSnackBar(getSnackbar(context, '正在努力生成中!'));

  late final Directory saveDir;
  late final Directory prefix;
  if (Platform.isAndroid) {
    prefix = Directory('/storage/emulated/0/Documents');
  } else {
    prefix = await getApplicationDocumentsDirectory();
  }
  saveDir = Directory(path.join(prefix.path, 'colorify'));

  final pp = Provider.of<particle_args_provider.ToParticlesArgProvider>(context, listen: false);
  final bp = Provider.of<block_args_provider.ToBlocksArgProvider>(context, listen: false);

  final genParticle = fp.selectedFunction == Functions.toParticles ? true : false;
  final bool arch = genParticle
      ? pp.pack == particle_args_provider.Pack.y
      : bp.pack == block_args_provider.Pack.y;
  final bool useStruct = bp.useStructure == block_args_provider.UseStructure.use;
  final generator = genParticle ? ParticleGenerator(pp) : BlockGenerator(bp);
  final generatorType = genParticle ? GeneratorType.Particle : GeneratorType.Block;
  final pkgName = genParticle ? pp.packName : bp.packName;
  final pkgDescrip = genParticle ? pp.packDescription : bp.packDescription;
  final archiver = Archiver(
    context: context,
    type: generatorType,
    dir: saveDir,
    arch: arch,
    useStruct: useStruct,
    packageName: pkgName.text,
    packageDescription: pkgDescrip.text,
  );

  await archiver.prep();
  await archiver.gen(context, generator.generate(saveDir, arch), arch);
}
