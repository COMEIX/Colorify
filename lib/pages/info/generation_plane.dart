// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage GenerationPlaneInfoPage() {
  return const InfoPage(
    title: '生成平面',
    content: [
      '生成平面。即所生成粒子画/像素画所在平面。',
      '粒子画/像素画将以居中的形式生成在选中平面中指定点的位置。',
    ],
    defaultValue: '默认值为 xOy。',
  );
}