// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage ParticleHeightInfoPage() {
  return const InfoPage(
    title: '粒子画高度',
    content: [
      '粒子画高度。粒子画在游戏中的高度(单位：格',
      '仅提供修改高度的变量，因为默认锁死了原图片的宽高比，原图片会在对应高度下等比压缩',
    ],
    defaultValue: '默认粒子画高度为5.0',
  );
}