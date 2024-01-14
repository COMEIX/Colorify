import 'package:flutter/material.dart';

class LoadingStateProvider with ChangeNotifier {
  bool _state = false;

  bool get state => _state;

  updateState(bool v) {
    _state = v;
  }
}
