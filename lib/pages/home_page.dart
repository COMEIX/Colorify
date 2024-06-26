
import 'package:intl/intl.dart';
import 'package:colorify/const.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:colorify/pages/block.dart';
import 'package:colorify/pages/drawer.dart';
import 'package:colorify/pages/particle.dart';
import 'package:colorify/backend/io/index.dart';
import 'package:colorify/pages/constructing.dart';
import 'package:colorify/pages/acknowledgements.dart';
import 'package:colorify/backend/providers/function_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Fuck if-else
  // I'll remove this piece of shit code next refactored version
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
              // This fucking repeatedly appearing "PingFang SC" would be removed as well
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
