import 'dart:io';
import 'package:colorify/backend/io/index.dart';
import 'package:colorify/backend/providers/function_provider.dart';
import 'package:colorify/components/snackbar.dart';
import 'package:colorify/pages/acknowledgements.dart';
import 'package:colorify/pages/constructing.dart';
import 'package:colorify/pages/drawer.dart';
import 'package:colorify/pages/to_blocks.dart';
import 'package:colorify/pages/to_particles.dart';
import 'package:provider/provider.dart';

import '../const.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _getBody(Functions func) {
    if (func == Functions.toParticles) {
      return const ToParticles();
    } else if (func == Functions.toBlocks) {
      return const ToBlocks();
    } else if (func == Functions.createQrcode) {
      return const Constructing();
    } else if (func == Functions.transExeFormat) {
      return const Constructing();
    } else if (func == Functions.acknowledgement) {
      return const Acknowledgement();
    } else {
      return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final now = DateTime.now();
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(57),
        child: GestureDetector(
          onPanStart: (details) {
            if (Platform.isWindows) windowManager.startDragging();
          },
          child: AppBar(
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            leading: TextButton(
              child: Icon(
                Icons.dehaze,
                color: lightIconColor,
              ),
              onPressed: () {
                scaffoldKey.currentState?.openDrawer();
              },
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today",
                  style: TextStyle(
                    fontFamily: "PingFang SC",
                    fontSize: 14,
                  ),
                ),
                Text(
                  '${DateFormat("EEE", "en-US").format(now)}, ${DateFormat("MMM", "en-US").format(now)}, ${now.year}',
                  style: TextStyle(
                    color: lightIconColor,
                    fontFamily: "PingFang SC",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: _getBody(context.watch<FunctionProvider>().selectedFunction),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        backgroundColor: lightBackgroundColor,
        focusColor: lightMenuColor,
        foregroundColor: lightIconColor,
        splashColor: lightPopupColor,
        label: Text(
          "生成",
          style: TextStyle(
            color: lightIconColor,
            fontFamily: "PingFang SC",
          ),
        ),
        icon: Icon(
          Icons.add,
          color: lightIconColor,
        ),
        onPressed: () {
          generate(context);
        },
      ),
    );
  }
}
