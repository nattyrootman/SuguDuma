import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/bottom_nav_bar/hosting_screens.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hope/themes/mytheme.dart';

import 'constants/constant.dart';
import 'screens/home_screen/home_screen.dart';
import 'sign_screens/sign_up.dart';

//npm install -g npm/*
/*void main() {
  runApp(const MyApp());
}*/

void main() => runApp(
      DevicePreview(
        //enabled: true,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        themeMode: ThemeMode.system,
        darkTheme: themeController.getTheme(),
        home: const HostingScreen()));
  }
}


/*MythemeData.isDark
            ? MythemeData.ligthThem
            : MythemeData.darkThemData,*/




            