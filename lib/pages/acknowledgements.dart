import 'package:colorify/const.dart';
import 'package:flutter/material.dart';

class Acknowledgement extends StatelessWidget {
  const Acknowledgement({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: lightBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Acknowledgement",
              style: TextStyle(
                color: lightIconColor,
                fontFamily: "PingFang SC",
                fontWeight: FontWeight.bold,
                fontSize: 45,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              'spnda/dart_minecraft',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Divider(),
            const Text(
              'Sky24n/flustars',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Divider(),
            const Text(
              'bitsdojo/bitsdojo_window',
              style: TextStyle(
                fontFamily: 'PingFang SC',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Divider(),
            const Text(
              '金羿ELS',
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
