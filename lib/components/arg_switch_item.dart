import 'package:colorify/components/arg_item_title_text.dart';
import 'package:colorify/components/info_buttion.dart';
import 'package:colorify/components/info_page.dart';
import 'package:colorify/const.dart';
import 'package:flutter/material.dart';

class SwitchArgItem extends StatelessWidget {
  final String title;
  final InfoPage infoPage;
  final bool value;
  final void Function(bool) onChanged;
  final bool hideInfoPage;
  const SwitchArgItem({
    Key? key,
    required this.title,
    required this.infoPage,
    required this.value,
    required this.onChanged,
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
        trailing: Transform.scale(
          scale: 0.9,
          child: Switch(
            activeColor: lightMenuColor,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
