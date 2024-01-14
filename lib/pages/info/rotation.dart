import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:colorify/const.dart';

class FittingRotationInfo extends StatelessWidget {
  const FittingRotationInfo({super.key});

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
              "旋转拟合",
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
              "\t\t即让粒子所处平面旋转，直至该平面法向量旋转到所给向量",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              "\t\t默认值为 Vector3(0, 1, 0)，即粒子将生成在 xOz 平面内",
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
