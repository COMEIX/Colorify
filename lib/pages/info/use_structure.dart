// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage UseStructureInfoPage() {
  return const InfoPage(
    title: '使用结构文件',
    content: [
      '开启后，会生成结构文件(.mcstructure)而非函数文件，仅适用于像素画',
    ],
    defaultValue: '默认为关',
  );
}