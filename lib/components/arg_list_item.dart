import 'package:colorify/components/arg_item_title_text.dart';
import 'package:colorify/components/info_buttion.dart';
import 'package:colorify/const.dart';
import 'package:colorify/components/info_page.dart';
import 'package:flutter/material.dart';

class ListArgItem extends StatelessWidget {
  final String title;
  final List<String> items;
  final int? initialSelection;
  final Function(int?) onSelected;
  final InfoPage infoPage;
  final bool hideInfoPage;
  const ListArgItem({
    Key? key,
    required this.title,
    required this.items,
    this.initialSelection = 0,
    required this.onSelected,
    required this.infoPage,
    this.hideInfoPage = false,
  }) : super(key: key);

  List<DropdownMenuEntry<int>> _getItems() {
    List<DropdownMenuEntry<int>> res = [];
    for (int i = 0; i < items.length; i++) {
      res.add(DropdownMenuEntry(value: i, label: items[i]));
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      decoration: BoxDecoration(
        color: lightPopupColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ArgItemTitle(title: title),
                if (!hideInfoPage) InfoButton(infoPage: infoPage),
              ],
            ),
            Transform.scale(
              scale: 0.7,
              child: DropdownMenu(
                width: 110,
                initialSelection: initialSelection,
                textStyle: const TextStyle(fontFamily: "PingFang SC", fontSize: 20),
                menuStyle: MenuStyle(
                  elevation: MaterialStateProperty.resolveWith((states) => 0),
                  backgroundColor: MaterialStateColor.resolveWith((states) => lightMenuColor),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: lightBackgroundColor,
                  filled: true,
                  contentPadding: const EdgeInsets.all(20),
                ),
                dropdownMenuEntries: _getItems(),
                onSelected: onSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
