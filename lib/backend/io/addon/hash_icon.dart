import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

Future<void> genHashIcon(Directory dir, String hashSeed) async {
  String hash = generateHash(hashSeed);
  img.Image image = generateIdenticon(hash, size: 50 + Random().nextInt(200));
  File file = File(dir.path);
  await file.writeAsBytes(img.encodePng(image));
}

String generateHash(String input) {
  var bytes = utf8.encode(input);
  var digest = sha256.convert(bytes);
  return digest.toString();
}

img.Image generateIdenticon(String hash, {int size = 200}) {
  int value = int.parse(hash.substring(0, 6), radix: 16);
  Color color = Color(value).withAlpha(255);

  img.Image image = img.Image(size, size);
  image.fill(img.getColor(color.red, color.green, color.blue));

  img.fillCircle(
    image,
    size ~/ 2,
    size ~/ 2,
    size ~/ 4 + Random().nextInt(size ~/ 4),
    img.getColor(
      Random().nextInt(255),
      Random().nextInt(255),
      Random().nextInt(255),
    ),
  );

  return image;
}
