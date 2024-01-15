import 'package:colorify/components/arg_item_title_text.dart';
import 'package:colorify/components/info_buttion.dart';
import 'package:colorify/const.dart';
import 'package:colorify/components/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StrArgItem extends StatelessWidget {
  final String title;
  final String hintText;
  final InfoPage infoPage;
  final TextEditingController controller;
  final bool hideInfoPage;
  const StrArgItem({
    Key? key,
    required this.title,
    required this.hintText,
    required this.infoPage,
    required this.controller,
    this.hideInfoPage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightPopupColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: Row(
          children: [
            ArgItemTitle(title: title),
            if (!hideInfoPage) InfoButton(infoPage: infoPage),
          ],
        ),
        subtitle: TextField(
          cursorColor: Colors.grey,
          controller: controller,
          decoration: InputDecoration(
            focusColor: lightIconColor,
            hintText: hintText,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: lightIconColor),
            ),
          ),
        ),
      ),
    );
  }
}
