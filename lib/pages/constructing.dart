import 'package:colorify/const.dart';
import 'package:flutter/material.dart';

class Constructing extends StatelessWidget {
  const Constructing({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        color: lightBackgroundColor,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '功能正在开发中~',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '急的话联系作者发电叭~',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '什么？找不到作者？',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              '打开侧边栏左下角有QQ邮箱哦',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
