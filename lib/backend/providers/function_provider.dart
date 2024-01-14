import 'package:flutter/material.dart';

enum Functions { toParticles, toBlocks, createQrcode, transExeFormat, acknowledgement }

class FunctionProvider with ChangeNotifier {
  Functions _selectedFunction = Functions.toParticles;

  get selectedFunction => _selectedFunction;

  void updateFunction(Functions v) {
    _selectedFunction = v;
    notifyListeners();
  }
}
