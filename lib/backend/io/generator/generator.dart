import 'dart:io';

abstract class Generator {
  Generator();

  Future<void> checkArgs();

  Future<dynamic> generate(Directory saveDir, bool arch);
}
