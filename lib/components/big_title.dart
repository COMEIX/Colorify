import 'package:colorify/const.dart';
import 'package:flutter/cupertino.dart';

class BigTitle extends StatelessWidget {
  final String title;
  const BigTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: lightIconColor,
        fontFamily: "PingFang SC",
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    );
  }
}
