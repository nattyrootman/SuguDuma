// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/my_image_rounded.dart';
import 'package:hope/screens/details_screen/Detail_screen.dart';
import 'package:hope/screens/home_screen/home_widgets/custom_path.dart';
import 'package:hope/screens/profile_screen/setting_items.dart';
import 'package:hope/screens/profile_screen/setting_list_titlte.dart';
import 'package:hope/utiles/colors.dart';
import 'package:hope/utiles/strings.dart';

import '../../common_widgets.dart/mycontainer.dart';
import 'profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      ClipPath(
        clipper: MyCustomCurvPath(),
        child: Mycontainer(
          //color: Colors.blue,
          gradient: MyColor.line1,
          height: 200,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text("Compte", style: Theme.of(context).textTheme.titleMedium),
                SettingListTitle(
                  leading: MyImageRound(
                      width: 50,
                      height: 50,
                      radius: 50,
                      image: "assets/product_images/shoe3.png"),
                  title: "Amed Bathi",
                  subtile: "bth@live.com",
                  trailing: IconButton(
                      onPressed: () => Get.to(ProfileModifaction()),
                      icon: Icon(Icons.edit)),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      Divider(),
      SettingListItems(),
      Divider(),
      SizedBox(height: 24),
      Mycontainer(
          width: MediaQuery.sizeOf(context).width / 1.5,
          radius: 15,
          height: 40,
          gradient: MyColor.line1,
          child: TextButton(
              onPressed: () => Get.to(DetailScreen()),
              child: Text(
                "Deconnexion",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))),
      SizedBox(height: 24),
    ])));
  }
}
