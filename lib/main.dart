import 'dart:io';
import 'package:colorify/box.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:colorify/pages/home_page.dart';
import 'package:window_manager/window_manager.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:colorify/backend/providers/function_provider.dart';
import 'package:colorify/backend/providers/blocks_arg_provider.dart';
import 'package:colorify/backend/providers/particles_arg_provider.dart';

void main() async {
  // * 无边框窗口化
  if (Platform.isWindows) {
    WidgetsFlutterBinding.ensureInitialized();
    WindowManager w = WindowManager.instance;
    await w.ensureInitialized();
    WindowOptions windowOptions = WindowOptions(
      size: await w.getSize(),
      center: true,
      titleBarStyle: TitleBarStyle.hidden,
    );
    w.waitUntilReadyToShow(windowOptions, () async {
      await w.setBackgroundColor(Colors.transparent);
      await w.show();
      await w.focus();
      await w.setAsFrameless();
    });
  }

  // * Android 请求权限
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    await requestFilePermission();
  }

  runApp(
    GestureDetector(
      onPanStart: (v) {
        if (Platform.isWindows) {
          windowManager.startDragging();
        }
      },
      child: GlobalBoxManager(
        child: const MyApp(),
      ),
    ),
  );

  // * 调整窗口大小
  if (Platform.isWindows) {
    doWhenWindowReady(() {
      final win = appWindow;

      const initialSize = Size(500, 1000);
      win.size = initialSize;
      win.alignment = Alignment.center;
      win.show();
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // * 沉浸式状态栏
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));
    // * Main
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<FunctionProvider>(create: (_) => FunctionProvider()),
          ChangeNotifierProvider<ToBlocksArgProvider>(create: (_) => ToBlocksArgProvider()),
          ChangeNotifierProvider<ToParticlesArgProvider>(create: (_) => ToParticlesArgProvider()),
        ],
        child: const HomePage(),
      ),
    );
  }
}

Future<void> requestFilePermission() async {
  final status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
  }
}
