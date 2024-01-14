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
  UseStructure _useStructure = UseStructure.notUse;
  Pack _pack = Pack.n;

  int get generationPlane => _generationPlane;
  TextEditingController get samplingRate => _samplingRate;
  AllowSand get allowSand => _allowSand;
  AllowGlass get allowGlass => _allowGlass;
  UseStructure get useStructure => _useStructure;
  Pack get pack => _pack;
  TextEditingController get packName => _packName;
  TextEditingController get packDescription => _packDescription;

  void updateGenerationPlane(int v) {
    _generationPlane = v;
    notifyListeners();
  }

  void updateAllowSand(AllowSand v) {
    _allowSand = v;
    notifyListeners();
  }

  void updateAllowGlass(AllowGlass v) {
    _allowGlass = v;
    notifyListeners();
  }

  void updateUseStructure(UseStructure v) {
    _useStructure = v;
    notifyListeners();
  }

  void updatePack(Pack v) {
    _pack = v;
    notifyListeners();
  }
}
