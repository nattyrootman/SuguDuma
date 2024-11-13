// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/screens/store_screen/store_screen.dart';
import 'package:hope/screens/home_screen/home_screen.dart';
import 'package:hope/screens/profile_screen/profil_infos/profile_screen.dart';
import 'package:hope/screens/favorite_screen/favorite.dart';

class HostingScreen extends StatelessWidget {
  const HostingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mycontroller = Get.put(NavController());

    return Obx(
      () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              useLegacyColorScheme: false,
              currentIndex: mycontroller.currentIndex.value,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.green,
              onTap: (int index) {
                mycontroller.getPage(index);
                // setState(() {
                // currentIndex = index;
                //});
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.store), label: "Store"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favorite"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profile")
              ]),
          body: mycontroller.pages[mycontroller.currentIndex.value]
          // pages[currentIndex],
          ),
    );
  }
}

class NavController extends GetxController {
  Rx<int> currentIndex = 0.obs;

  getPage(int index) {
    currentIndex.value = index;
  }

  List<Widget> pages = [
    HomeScreen(),
    StoreScreen(),
    FavoriteScreen(),
    ProfileScreen()
  ];
}
