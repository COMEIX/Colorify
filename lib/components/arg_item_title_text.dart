import 'package:colorify/const.dart';
import 'package:flutter/cupertino.dart';

class ArgItemTitle extends StatelessWidget {
  final String title;
  const ArgItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: "PingFang SC",
        fontSize: 20,
        color: lightIconColor,
      ),
    );
  }
}
