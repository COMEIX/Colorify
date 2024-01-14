import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:colorify/const.dart';

class ParticleTypeIdInfo extends StatelessWidget {
  const ParticleTypeIdInfo({super.key});

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
              "粒子ID Particle TypeId",
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
              "\t\t即粒子的命名空间ID。格式为 namespace:identifier",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t此值定义在粒子定义文件的 particle_effect -> description -> identifier 属性处",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t此粒子通常尺寸不宜过大(指超过1)",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              "\t\t默认值为minecraft:endrod",
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
