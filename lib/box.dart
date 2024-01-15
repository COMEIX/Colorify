// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:flutter/material.dart';

class GlobalBoxManager extends StatelessWidget {
  GlobalBoxManager({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows) {
      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}
