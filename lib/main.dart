import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/bottom_nav_bar/hosting_screens.dart';
import 'package:device_preview/device_preview.dart';
import 'package:hope/constants/constant.dart';
import 'package:hope/themes/theme_controller.dart';

import 'all_sign_screens/sign_repositories/authentication_repository.dart';
import 'all_sign_screens/sign_up/sign_up_screen.dart';
import 'firebase_options.dart';

import 'utiles/connectivity.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = true;
  WidgetsFlutterBinding.ensureInitialized();
  //Get.testMode = true;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  runApp(
    DevicePreview(
      enabled: true,
      // tools: [...DevicePreview.defaultTools],
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
            initialBinding: MyBinding(),
            title: 'Sougou',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            themeMode: ThemeMode.system,
            darkTheme: themeController.getTheme(),
            // home: MySplashScreen(),

            initialRoute: '/',
            getPages: [
              GetPage(name: '/', page: () => MySplashScreen()),
              GetPage(name: '/host', page: () => HostingScreen()),
              GetPage(name: '/sign_up', page: () => SignUpScreen()),
              GetPage(name: '/no_network', page: () => NoConnexionScreen()),
            ]));
  }
}

class MyBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ConnetivityController());
  }
}

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreen();
}

class _MySplashScreen extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sougou",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            // Image.asset("assets/sign_up_images/splash2.png"),
          ],
        ),
      ),
    );
  }
}
