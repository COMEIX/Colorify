import 'package:flutter/material.dart';

enum Rotate { y, n }

enum Pack { y, n }

class ToParticlesArgProvider with ChangeNotifier {
  final _samplingRate = TextEditingController();
  final _particleHeight = TextEditingController();
  final _particleTypeId = TextEditingController();
  final _targetColor = TextEditingController();
  Rotate _rotate = Rotate.n;
  final _rotX = TextEditingController();
  final _rotY = TextEditingController();
  final _rotZ = TextEditingController();
  Pack _pack = Pack.n;
  final _packName = TextEditingController();
  final _packDescription = TextEditingController();

  var _generationPlane = 0;

  TextEditingController get samplingRate => _samplingRate;
  TextEditingController get particleHeight => _particleHeight;
  TextEditingController get particleTypeId => _particleTypeId;
  TextEditingController get targetColor => _targetColor;
  int get generationPlane => _generationPlane;
  Rotate get rotate => _rotate;
  TextEditingController get rotX => _rotX;
  TextEditingController get rotY => _rotY;
  TextEditingController get rotZ => _rotZ;
  Pack get pack => _pack;
  TextEditingController get packName => _packName;
  TextEditingController get packDescription => _packDescription;

  void updateGenerationPlane(int v) {
    _generationPlane = v;
    notifyListeners();
  }

  void updateRotate(Rotate v) {
    _rotate = v;
    notifyListeners();
  }

  void updatePack(Pack v) {
    _pack = v;
    notifyListeners();
  }
}
