import 'package:flutter/material.dart';

SnackBar getSnackbar(BuildContext context, String content) {
  final Size size = MediaQuery.of(context).size;
  return SnackBar(
    content: Text(content),
    width: size.width * 0.8,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(milliseconds: 500),
  );
}
