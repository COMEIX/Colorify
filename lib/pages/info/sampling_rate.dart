import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:colorify/const.dart';

class SamplingRateInfo extends StatelessWidget {
  const SamplingRateInfo({super.key});

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
              "采样率 Sampling Rate",
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
              "\t\t采样率，指采样样本占总样本的比例。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t对于此软件处理的图片，每一个像素即为一个采样样本，总样本即图片的总像素大小。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t处理程序会用双层 for 循环遍历图片像素，采样率直接影响到 for 的步进。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Text(
              "\t\t由于现如今图片尺寸普遍较大，全采样下大部分像素经转进游戏中会由于挤压失去良好观感，而采样样本太多对于粒子画和像素画一般都不是一件好事。因此一般建议采用较小的采样率，来减少不必要的开销。",
              style: TextStyle(
                fontFamily: "PingFang SC",
                fontSize: 20,
              ),
            ),
            Divider(
              height: 20,
            ),
            Text(
              "\t\t粒子画默认采样率为0.5。像素画默认采样率为0.3。",
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
