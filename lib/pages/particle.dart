import 'package:colorify/backend/providers/particles_arg_provider.dart';
import 'package:colorify/components/arg_list_item.dart';
import 'package:colorify/components/arg_str_item.dart';
import 'package:colorify/components/arg_switch_item.dart';
import 'package:colorify/const.dart';
import 'package:colorify/components/info_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToParticles extends StatefulWidget {
  const ToParticles({super.key});

  @override
  State<ToParticles> createState() => _ToParticlesState();
}

class _ToParticlesState extends State<ToParticles> {
  @override
  Widget build(BuildContext context) {
    final args = context.watch<ToParticlesArgProvider>();
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        color: lightBackgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Arguments",
                style: TextStyle(
                  color: lightIconColor,
                  fontFamily: "PingFang SC",
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const SizedBox(height: 20),
              StrArgItem(
                title: '采样率',
                hintText: '(0, 1]',
                infoPage: const InfoPage(
                  title: '采样率',
                  content: [],
                  defaultValue: '',
                ),
                controller: args.samplingRate,
              ),
              const SizedBox(height: 20),
              StrArgItem(
                title: '粒子画高度',
                hintText: '5.0',
                infoPage: const InfoPage(
                  title: '粒子画高度',
                  content: [],
                  defaultValue: '',
                ),
                controller: args.particleHeight,
              ),
              const SizedBox(height: 20),
              StrArgItem(
                title: '粒子ID',
                hintText: 'namespace:identifier',
                infoPage: const InfoPage(
                  title: '粒子ID',
                  content: [],
                  defaultValue: '',
                ),
                controller: args.samplingRate,
              ),
              const SizedBox(height: 20),
              StrArgItem(
                title: '目标颜色',
                hintText: '#000000',
                infoPage: const InfoPage(
                  title: '目标颜色',
                  content: [],
                  defaultValue: '',
                ),
                controller: args.samplingRate,
              ),
              const SizedBox(height: 20),
              ListArgItem(
                title: '生成平面',
                items: const ['xOy', 'yOz', 'xOz'],
                initialSelection: args.generationPlane,
                onSelected: (v) => args.updateGenerationPlane(v!),
                infoPage: const InfoPage(
                  content: [],
                  title: '',
                  defaultValue: '',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SwitchArgItem(
                title: '旋转拟合',
                infoPage: const InfoPage(
                  content: [],
                  title: '',
                  defaultValue: '',
                ),
                value: args.doRotate,
                onChanged: (v) => args.updateRotate(v),
              ),
              if (args.doRotate) const SizedBox(height: 20),
              if (args.doRotate)
                StrArgItem(
                  title: 'X',
                  hintText: '待拟合的向量的 x 轴分量',
                  hideInfoPage: true,
                  infoPage: const InfoPage(
                    title: '',
                    content: [],
                    defaultValue: '',
                  ),
                  controller: args.rotX,
                ),
              if (args.doRotate) const SizedBox(height: 20),
              if (args.doRotate)
                StrArgItem(
                  title: 'Y',
                  hintText: '待拟合的向量的 y 轴分量',
                  hideInfoPage: true,
                  infoPage: const InfoPage(
                    title: '',
                    content: [],
                    defaultValue: '',
                  ),
                  controller: args.rotY,
                ),
              if (args.doRotate)
                const SizedBox(
                  height: 20,
                ),
              if (args.doRotate)
                StrArgItem(
                  title: 'Z',
                  hintText: '待拟合的向量的 z 轴分量',
                  hideInfoPage: true,
                  infoPage: const InfoPage(
                    title: '',
                    content: [],
                    defaultValue: '',
                  ),
                  controller: args.rotZ,
                ),
              const SizedBox(
                height: 20,
              ),
              SwitchArgItem(
                title: '打包',
                infoPage: const InfoPage(
                  content: [],
                  title: '',
                  defaultValue: '',
                ),
                value: args.doPack,
                onChanged: (v) => args.updatePack(v),
              ),
              const SizedBox(
                height: 20,
              ),
              if (args.doPack)
                StrArgItem(
                  title: '包的名称',
                  hintText: 'Name of the package',
                  hideInfoPage: true,
                  infoPage: const InfoPage(
                    title: '',
                    content: [],
                    defaultValue: '',
                  ),
                  controller: args.packName,
                ),
              const SizedBox(
                height: 20,
              ),
              if (args.doPack)
                StrArgItem(
                  title: '包的描述',
                  hintText: 'Description of the package',
                  hideInfoPage: true,
                  infoPage: const InfoPage(
                    title: '',
                    content: [],
                    defaultValue: '',
                  ),
                  controller: args.packName,
                ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
