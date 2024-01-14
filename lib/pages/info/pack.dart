import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:colorify/const.dart';

class PackInfo extends StatelessWidget {
  const PackInfo({super.key});

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
              "打包",
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
              "\t\t开启打包，会直接生成一个行为包(后缀为.mcpack)",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t该包根据不同情况可能包含了 1.函数文件 2.脚本文件 3.结构文件，以及包体必要的清单文件和图标。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t用户负责填写包名和包的描述，若不填则会自动生成。(包名会是生成时的时间，包的描述是固定的)。UUID, 图标等均会自动生成。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t脚本文件负责执行方便化生成粒子/像素画的任务，适用于对行为包了解较少的用户。但因为基岩版脚本框架频繁变动，所以不保证一定可用。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              "\t\t默认为关",
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
