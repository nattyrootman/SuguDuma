// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/my_image_rounded.dart';
import 'package:hope/screens/home_screen/home_widgets/custom_path.dart';
import 'package:hope/screens/profile_screen/settings_widgets/setting_items.dart';
import 'package:hope/screens/profile_screen/settings_widgets/setting_list_titlte.dart';
import 'package:hope/utiles/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../all_sign_screens/sign_repositories/user_controller.dart';
import '../../../common_widgets.dart/mycontainer.dart';
import '../../../all_sign_screens/sign_controllers/sign_up_controller.dart';
import 'profile_info.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final userController = Get.put(UserController());
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
                  title: userController.getUser.firstName,
                  subtile: userController.getUser.email,
                  trailing: IconButton(
                      onPressed: () => Get.to(ProfileModifySceen()),
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
              onPressed: () => controller.Logout(),
              child: Text(
                "Deconnexion",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ))),
      SizedBox(height: 24),
    ])));
  }
}
