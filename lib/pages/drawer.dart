import 'package:colorify/backend/providers/function_provider.dart';
import 'package:colorify/components/drawer_list_item.dart';
import 'package:colorify/components/snackbar.dart';
import 'package:colorify/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final functions = Provider.of<FunctionProvider>(context);
    return Drawer(
      width: size.width * 0.7,
      backgroundColor: lightBackgroundColor,
      child: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 57,
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Settings",
                        style: TextStyle(
                          color: lightIconColor,
                          fontFamily: "PingFang SC",
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  DrawerListItem(
                    text: '生成粒子画',
                    icon: Icons.bubble_chart,
                    onPressed: () {
                      functions.updateFunction(Functions.toParticles);
                    },
                  ),
                  DrawerListItem(
                    text: '生成像素画',
                    icon: Icons.filter_hdr,
                    onPressed: () {
                      functions.updateFunction(Functions.toBlocks);
                    },
                  ),
                  DrawerListItem(
                    text: '生成二维码',
                    icon: Icons.qr_code,
                    onPressed: () {
                      functions.updateFunction(Functions.createQrcode);
                    },
                  ),
                  DrawerListItem(
                    text: '新旧 execute 格式转换',
                    icon: Icons.cached,
                    onPressed: () {
                      functions.updateFunction(Functions.transExeFormat);
                    },
                  ),
                  DrawerListItem(
                    text: '特别鸣谢',
                    icon: Icons.eco,
                    onPressed: () {
                      functions.updateFunction(Functions.acknowledgement);
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'v3.0.0',
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                    ),
                  ),
                  const Text(
                    'Jan 2024',
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                    ),
                  ),
                  const Text(
                    'COMEIX - 2245638853@qq.com',
                    style: TextStyle(
                      fontFamily: 'PingFang SC',
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
