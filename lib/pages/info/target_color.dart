import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:colorify/const.dart';

class TargetColorInfo extends StatelessWidget {
  const TargetColorInfo({super.key});

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
            title: const Text(
              "详情页",
              style: TextStyle(
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "目标颜色 Target Color",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              "\t\t目标颜色。指识别为粒子的颜色。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t因为粒子画是基于某一种粒子的，由此无法做到全彩(或区别所有颜色)，所以只能将某一种颜色识别为粒子，那么相对应的，剩余的颜色会被抛弃。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t识别范围为 RGB 三维空间下距离小于等于30的色值。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t输入时可以输入 # 前缀也可以不输入。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              "\t\t默认值为 #000000，即纯黑。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
