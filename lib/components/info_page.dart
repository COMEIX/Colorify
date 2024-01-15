import 'dart:io';

import 'package:colorify/const.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

class InfoPage extends StatelessWidget {
  final String title;
  final List<String> content;
  final String defaultValue;
  const InfoPage({
    Key? key,
    required this.title,
    required this.content,
    required this.defaultValue,
  }) : super(key: key);

  Text _getText(String str) {
    return Text(
      str,
      style: const TextStyle(
        fontFamily: "PingFang SC",
        fontSize: 20,
      ),
    );
  }

  List<Text> _getContent() {
    List<Text> res = [];
    for (int i = 0; i < content.length; i++) {
      res.add(_getText(content[i]));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: GestureDetector(
          onPanStart: (details) {
            if (Platform.isWindows) windowManager.startDragging();
          },
          child: AppBar(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            title: Text(
              "$title详情页",
              style: const TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: lightBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(height: 20),
            ..._getContent(),
            const Divider(height: 20),
            _getText(defaultValue),
          ],
        ),
      ),
    );
  }
}
