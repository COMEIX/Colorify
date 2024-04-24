// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage TargetColorInfoPage() {
  return const InfoPage(
    title: '目标颜色',
    content: [
      '目标颜色。指识别为粒子的颜色。',
      '因为粒子画是基于某一种粒子的，由此无法做到全彩(或区别所有颜色)，所以只能将某一种颜色识别为粒子，那么相对应的，剩余的颜色会被抛弃。',
      '识别范围为 RGB 三维空间下距离小于等于30的色值。',
      '输入时可以输入 # 前缀也可以不输入。',
    ],
    defaultValue: '默认值为 #000000，即纯黑。',
  );
}