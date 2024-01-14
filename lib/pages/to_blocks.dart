import 'package:colorify/backend/providers/blocks_arg_provider.dart';
import 'package:colorify/const.dart';
import 'package:colorify/pages/info/pack.dart';
import 'package:colorify/pages/info/sampling_rate.dart';
import 'package:colorify/pages/info/useStructure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:colorify/pages/info/generation_plane.dart';

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
              Text(
                "Arguments",
                style: TextStyle(
                  color: lightIconColor,
                  fontFamily: "PingFang SC",
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightPopupColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        "采样率",
                        style: TextStyle(
                          fontFamily: "PingFang SC",
                          fontSize: 20,
                          color: lightIconColor,
                        ),
                      ),
                      GestureDetector(
                        child: Transform.scale(
                          scale: 0.8,
                          child: Icon(
                            Icons.info_outline,
                            color: lightIconColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return const SamplingRateInfo();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  subtitle: TextField(
                    controller: args.samplingRate,
                    decoration: const InputDecoration(
                      hintText: "(0,1]",
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: lightPopupColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "生成平面",
                            style: TextStyle(
                              fontFamily: "PingFang SC",
                              fontSize: 20,
                              color: lightIconColor,
                            ),
                          ),
                          GestureDetector(
                            child: Transform.scale(
                              scale: 0.8,
                              child: Icon(
                                Icons.info_outline,
                                color: lightIconColor,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                    return const GenerationPlaneInfo();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 0.7,
                        child: DropdownMenu(
                          width: 110,
                          initialSelection: args.generationPlane,
                          textStyle: const TextStyle(fontFamily: "PingFang SC", fontSize: 20),
                          menuStyle: MenuStyle(
                            elevation: MaterialStateProperty.resolveWith((states) => 0),
                            backgroundColor:
                                MaterialStateColor.resolveWith((states) => lightMenuColor),
                          ),
                          inputDecorationTheme: InputDecorationTheme(
                            fillColor: lightBackgroundColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(20),
                          ),
                          dropdownMenuEntries: const [
                            DropdownMenuEntry(value: 0, label: "xOy"),
                            DropdownMenuEntry(value: 1, label: "yOz"),
                            DropdownMenuEntry(value: 2, label: "xOz"),
                          ],
                          onSelected: (v) {
                            if (v == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.grey.shade700,
                                  elevation: 0,
                                  width: 300,
                                  behavior: SnackBarBehavior.floating,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  duration: const Duration(milliseconds: 900),
                                  content: const Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Invalid generation plane",
                                      style: TextStyle(fontFamily: "PingFang SC"),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              args.updateGenerationPlane(v);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightPopupColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Text(
                    "是否允许存在沙子",
                    style: TextStyle(
                      fontFamily: "PingFang SC",
                      fontSize: 20,
                      color: lightIconColor,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      activeColor: lightMenuColor,
                      value: args.allowSand == AllowSand.allow ? true : false,
                      onChanged: (v) {
                        args.updateAllowSand(v ? AllowSand.allow : AllowSand.notAllow);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightPopupColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Text(
                    "是否允许存在玻璃",
                    style: TextStyle(
                      fontFamily: "PingFang SC",
                      fontSize: 20,
                      color: lightIconColor,
                    ),
                  ),
                  trailing: Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      activeColor: lightMenuColor,
                      value: args.allowGlass == AllowGlass.allow ? true : false,
                      onChanged: (v) {
                        args.updateAllowGlass(v ? AllowGlass.allow : AllowGlass.notAllow);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightPopupColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        "使用结构文件",
                        style: TextStyle(
                          fontFamily: "PingFang SC",
                          fontSize: 20,
                          color: lightIconColor,
                        ),
                      ),
                      GestureDetector(
                        child: Transform.scale(
                          scale: 0.8,
                          child: Icon(
                            Icons.info_outline,
                            color: lightIconColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return const UseStructureInfo();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  trailing: Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      activeColor: lightMenuColor,
                      value: args.useStructure == UseStructure.use ? true : false,
                      onChanged: (v) {
                        args.updateUseStructure(v ? UseStructure.use : UseStructure.notUse);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightPopupColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        "打包",
                        style: TextStyle(
                          fontFamily: "PingFang SC",
                          fontSize: 20,
                          color: lightIconColor,
                        ),
                      ),
                      GestureDetector(
                        child: Transform.scale(
                          scale: 0.8,
                          child: Icon(
                            Icons.info_outline,
                            color: lightIconColor,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) {
                                return const PackInfo();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  trailing: Transform.scale(
                    scale: 0.9,
                    child: Switch(
                      activeColor: lightMenuColor,
                      value: args.pack == Pack.y ? true : false,
                      onChanged: (v) {
                        args.updatePack(v ? Pack.y : Pack.n);
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (args.pack == Pack.y)
                Container(
                  decoration: BoxDecoration(
                    color: lightPopupColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: Text(
                      "包的名称",
                      style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontSize: 20,
                        color: lightIconColor,
                      ),
                    ),
                    subtitle: TextField(
                      controller: args.packName,
                      decoration: const InputDecoration(
                        hintText: "Name of the package",
                      ),
                    ),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              if (args.pack == Pack.y)
                Container(
                  decoration: BoxDecoration(
                    color: lightPopupColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: Text(
                      "包的描述",
                      style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontSize: 20,
                        color: lightIconColor,
                      ),
                    ),
                    subtitle: TextField(
                      controller: args.packDescription,
                      decoration: const InputDecoration(
                        hintText: "Description of the package",
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
