import 'package:colorify/const.dart';
import 'package:colorify/pages/info/generation_plane.dart';
import 'package:colorify/pages/info/pack.dart';
import 'package:colorify/pages/info/sampling_rate.dart';
import 'package:colorify/pages/info/use_structure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:colorify/components/info_page.dart';
import 'package:colorify/components/big_title.dart';
import 'package:colorify/components/arg_str_item.dart';
import 'package:colorify/components/arg_list_item.dart';
import 'package:colorify/components/arg_switch_item.dart';
import 'package:colorify/backend/providers/blocks_arg_provider.dart';

class ToBlocks extends StatefulWidget {
  const ToBlocks({super.key});

  @override
  State<ToBlocks> createState() => _ToBlocksState();
}

class _ToBlocksState extends State<ToBlocks> {
  @override
  Widget build(BuildContext context) {
    final args = context.watch<ToBlocksArgProvider>();
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
              const BigTitle(title: 'Arguments'),
              const SizedBox(height: 20),
              StrArgItem(
                title: '采样率',
                hintText: '(0, 1]',
                infoPage: SamplingRateInfoPage(),
                controller: args.samplingRate,
              ),
              const SizedBox(height: 20),
              ListArgItem(
                title: '生成平面',
                items: const ['xOy', 'yOz', 'xOz'],
                initialSelection: args.generationPlane,
                onSelected: (v) => args.updateGenerationPlane(v!),
                infoPage: GenerationPlaneInfoPage(),
              ),
              const SizedBox(height: 20),
              SwitchArgItem(
                title: '是否允许存在沙子',
                hideInfoPage: true,
                infoPage: const InfoPage(
                  content: [],
                  title: '',
                  defaultValue: '',
                ),
                value: args.allowSand,
                onChanged: (v) => args.updateAllowSand(v),
              ),
              const SizedBox(height: 20),
              SwitchArgItem(
                title: '是否允许存在玻璃',
                hideInfoPage: true,
                infoPage: const InfoPage(
                  content: [],
                  title: '',
                  defaultValue: '',
                ),
                value: args.allowGlass,
                onChanged: (v) => args.updateAllowGlass(v),
              ),
              const SizedBox(height: 20),
              SwitchArgItem(
                title: '使用结构文件',
                infoPage: UseStructureInfoPage(),
                value: args.useStruct,
                onChanged: (v) => args.updateUseStruct(v),
              ),
              const SizedBox(height: 20),
              SwitchArgItem(
                title: '打包',
                infoPage: PackInfoPage(),
                value: args.pack == Pack.y,
                onChanged: (v) => args.updatePack(v),
              ),
              const SizedBox(height: 20),
              if (args.pack == Pack.y)
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
              const SizedBox(height: 20),
              if (args.pack == Pack.y)
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
            ],
          ),
        ),
      ),
    );
  }
}
