import 'package:colorify/const.dart';
import 'package:flutter/material.dart';

class DrawerListItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function() onPressed;
  const DrawerListItem({Key? key, required this.text, required this.onPressed, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.08,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          textStyle: const TextStyle(fontFamily: 'PingFang SC', fontSize: 18),
          foregroundColor: lightIconColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            if (icon != null) Icon(icon),
            if (icon != null)
              SizedBox(
                width: size.width * 0.05,
              ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
