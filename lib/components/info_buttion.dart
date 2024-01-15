import 'package:colorify/const.dart';
import 'package:colorify/components/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  final InfoPage infoPage;
  const InfoButton({
    Key? key,
    required this.infoPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.scale(
        scale: 0.8,
        child: Icon(
          Icons.info_outline,
          color: lightIconColor,
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (BuildContext context) {
              return infoPage;
            },
          ),
        );
      },
    );
  }
}
