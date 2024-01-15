import 'package:flutter/material.dart';

enum AllowSand { allow, notAllow }

enum AllowGlass { allow, notAllow }

enum UseStructure { use, notUse }

enum Pack { y, n }

class ToBlocksArgProvider with ChangeNotifier {
  final _samplingRate = TextEditingController();
  final _packName = TextEditingController();
  final _packDescription = TextEditingController();
  var _generationPlane = 0;

  AllowSand _allowSand = AllowSand.allow;
  AllowGlass _allowGlass = AllowGlass.allow;
  UseStructure _useStruct = UseStructure.notUse;
  Pack _pack = Pack.n;

  int get generationPlane => _generationPlane;
  TextEditingController get samplingRate => _samplingRate;
  bool get allowSand => _allowSand == AllowSand.allow;
  bool get allowGlass => _allowGlass == AllowGlass.allow;
  bool get useStruct => _useStruct == UseStructure.use;
  Pack get pack => _pack;
  TextEditingController get packName => _packName;
  TextEditingController get packDescription => _packDescription;

  void updateGenerationPlane(int v) {
    _generationPlane = v;
    notifyListeners();
  }

  void updateAllowSand(bool v) {
    _allowSand = v ? AllowSand.allow : AllowSand.notAllow;
    notifyListeners();
  }

  void updateAllowGlass(bool v) {
    _allowGlass = v ? AllowGlass.allow : AllowGlass.notAllow;
    notifyListeners();
  }

  void updateUseStruct(bool v) {
    _useStruct = v ? UseStructure.use : UseStructure.notUse;
    notifyListeners();
  }

  void updatePack(bool v) {
    _pack = v ? Pack.y : Pack.n;
    notifyListeners();
  }
}
