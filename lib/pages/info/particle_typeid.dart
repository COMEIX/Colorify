// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage ParticleTypeIdInfoPage() {
  return const InfoPage(
    title: '粒子ID',
    content: [
      '即粒子的命名空间ID。格式为 namespace:identifier',
      '此值定义在粒子定义文件的 particle_effect -> description -> identifier 属性处。',
      '此粒子通常尺寸不宜过大(指超过1)',
    ],
    defaultValue: '默认值为minecraft:endrod',
  );
}