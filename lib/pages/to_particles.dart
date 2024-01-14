import 'package:colorify/backend/providers/particles_arg_provider.dart';
import 'package:colorify/const.dart';
import 'package:colorify/pages/info/generation_plane.dart';
import 'package:colorify/pages/info/pack.dart';
import 'package:colorify/pages/info/particle_height.dart';
import 'package:colorify/pages/info/particle_typeid.dart';
import 'package:colorify/pages/info/rotation.dart';
import 'package:colorify/pages/info/sampling_rate.dart';
import 'package:colorify/pages/info/target_color.dart';
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
                      )
                    ],
                  ),
                  subtitle: TextField(
                    cursorColor: Colors.grey,
                    controller: args.samplingRate,
                    decoration: InputDecoration(
                      focusColor: lightIconColor,
                      hintText: "(0,1]",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lightIconColor),
                      ),
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
                        "粒子画高度",
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
                                return const ParticleHeightInfo();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  subtitle: TextField(
                    cursorColor: Colors.grey,
                    controller: args.particleHeight,
                    decoration: InputDecoration(
                      hintText: "5",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lightIconColor),
                      ),
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
                        "粒子ID",
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
                                return const ParticleTypeIdInfo();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  subtitle: TextField(
                    cursorColor: Colors.grey,
                    controller: args.particleTypeId,
                    decoration: InputDecoration(
                      hintText: "namespace:identifier",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lightIconColor),
                      ),
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
                        "目标颜色",
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
                                return const TargetColorInfo();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                  subtitle: TextField(
                    cursorColor: Colors.grey,
                    controller: args.targetColor,
                    decoration: InputDecoration(
                      hintText: "#000000",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: lightIconColor),
                      ),
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
                  title: Row(
                    children: [
                      Text(
                        "旋转拟合",
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
                                return const FittingRotationInfo();
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
                      value: args.rotate == Rotate.y ? true : false,
                      onChanged: (v) {
                        args.updateRotate(v ? Rotate.y : Rotate.n);
                      },
                    ),
                  ),
                ),
              ),
              if (args.rotate == Rotate.y)
                const SizedBox(
                  height: 20,
                ),
              if (args.rotate == Rotate.y)
                Container(
                  decoration: BoxDecoration(
                    color: lightPopupColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: Text(
                      "X",
                      style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontSize: 20,
                        color: lightIconColor,
                      ),
                    ),
                    subtitle: TextField(
                      controller: args.rotX,
                      decoration: const InputDecoration(
                        hintText: "待拟合的向量的 x 轴分量",
                      ),
                    ),
                  ),
                ),
              if (args.rotate == Rotate.y)
                const SizedBox(
                  height: 20,
                ),
              if (args.rotate == Rotate.y)
                Container(
                  decoration: BoxDecoration(
                    color: lightPopupColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: Text(
                      "Y",
                      style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontSize: 20,
                        color: lightIconColor,
                      ),
                    ),
                    subtitle: TextField(
                      controller: args.rotY,
                      decoration: const InputDecoration(
                        hintText: "待拟合的向量的 y 轴分量",
                      ),
                    ),
                  ),
                ),
              if (args.rotate == Rotate.y)
                const SizedBox(
                  height: 20,
                ),
              if (args.rotate == Rotate.y)
                Container(
                  decoration: BoxDecoration(
                    color: lightPopupColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: ListTile(
                    title: Text(
                      "Z",
                      style: TextStyle(
                        fontFamily: "PingFang SC",
                        fontSize: 20,
                        color: lightIconColor,
                      ),
                    ),
                    subtitle: TextField(
                      controller: args.rotZ,
                      decoration: const InputDecoration(
                        hintText: "待拟合的向量的 z 轴分量",
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
