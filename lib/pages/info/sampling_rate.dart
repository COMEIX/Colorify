// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage SamplingRateInfoPage() {
  return const InfoPage(
    title: '采样率',
    content: [
      '采样率，指采样样本占总样本的比例。',
      '对于此软件处理的图片，每一个像素即为一个采样样本，总样本即图片的总像素大小。',
      '处理程序会用双层 for 循环遍历图片像素，采样率直接影响到 for 的步进。',
      '由于现如今图片尺寸普遍较大，全采样下大部分像素经转进游戏中会由于挤压失去良好观感，而采样样本太多对于粒子画和像素画一般都不是一件好事。因此一般建议采用较小的采样率，来减少不必要的开销。',
    ],
    defaultValue: '粒子画默认采样率为0.5。像素画默认采样率为0.3。',
  );
}
