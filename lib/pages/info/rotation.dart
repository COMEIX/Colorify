// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage FittingRotationInfoPage() {
  return const InfoPage(
    title: '旋转拟合',
    content: [
      '即让粒子所处平面旋转，直至该平面法向量旋转到所给向量',
    ],
    defaultValue: '默认值为 Vector3(0, 1, 0)，即粒子将生成在 xOz 平面内',
  );
}