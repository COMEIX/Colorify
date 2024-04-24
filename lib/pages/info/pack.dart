// ignore_for_file: non_constant_identifier_names
import 'package:colorify/components/info_page.dart';

InfoPage PackInfoPage() {
  return const InfoPage(
    title: '打包',
    content: [
      '开启打包，会直接生成一个行为包(后缀为.mcpack)',
      '该包根据不同情况可能包含了 1.函数文件 2.脚本文件 3.结构文件，以及包体必要的清单文件和图标',
      '用户负责填写包名和包的描述，若不填则会自动生成。(包名会是生成时的时间，包的描述是固定的)。UUID, 图标等均会自动生成',
      '脚本文件负责执行方便化生成粒子/像素画的任务，适用于对行为包了解较少的用户。但因为基岩版脚本框架频繁变动，所以不保证一定可用。',
    ],
    defaultValue: '默认为关',
  );
}