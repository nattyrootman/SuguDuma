// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/heading_section.dart';
import 'package:hope/common_widgets.dart/my_grid_view.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/common_widgets.dart/myhorizontal_list.dart';
import 'package:hope/common_widgets.dart/myproduct_card.dart';
import 'package:hope/models/user_models/user_model.dart';
import 'package:hope/screens/home_screen/home_widgets/my_carousel.dart';
import 'package:hope/themes/theme_controller.dart';
import 'package:hope/utiles/mytext_field.dart';

import '../../all_sign_screens/sign_repositories/authentication_repository.dart';
import '../../all_sign_screens/sign_repositories/user_controller.dart';
import '../../constants/constant.dart';
import '../../features/sub_categegories/subcategorie_screen.dart';
import '../all_product_screen/all_product_screen.dart';
import 'home_widgets/vertical_item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // CarouselController? controller;
  // int currentIndex = 0;

  //var isDark = false;

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    final userController = Get.put(UserController());

    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
                "SuguDuma  ${userController.getUser.firstName}",
              )),
          actions: [
            Obx(() => Container(
                  // height: 50,
                  padding: EdgeInsets.all(0.0),
                  width: MediaQuery.sizeOf(context).width / 2.5,
                  child: Stack(
                    children: [
                      Positioned(
                          right: 45,
                          child: InkWell(
                              onTap: () {
                                themeController.isDark.value =
                                    !themeController.isDark.value;
                              },
                              child: Icon(themeController.isDark.value
                                  ? Icons.dark_mode
                                  : Icons.light_mode))),
                      Positioned(
                          right: 5,
                          child: InkWell(
                              onTap: () {},
                              child: Icon(Icons.add_shopping_cart)))
                    ],
                  ),
                ))
          ],
        ),
        body: ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 410,
                        //width: double.infinity,
                        //color: Colors.blue,
                        //padding: E
                        //gradient: MyColor.line1,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextField(
                                text: "Search Products",
                                suffix: Icon(Icons.search),
                              ),
                              Text("New arrivals",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              MyCarouselSlider(),
                              SizedBox(height: 25),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Popular Categories",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    SizedBox(height: 5),
                                    SizedBox(
                                        height: 100,
                                        child: MyhorizontalList(
                                            itemCount: horizontalItem.length,
                                            itemBuilder: (_, int index) {
                                              return VerticalItemCard(
                                                  index: index,
                                                  onTap: () => Get.to(
                                                      SubcategoryScreen()));
                                            }))
                                  ])
                            ])),
                    HeadingSectionTtile(
                        title: 'All Products',
                        showBtn: true,
                        onPressed: () => Get.to(AllProductScreen())),
                    MyGridView(
                        iShrink: true,
                        itemBuilder: (_, int index) {
                          return MyproductItemCard();
                        })
                  ]))
        ]));
  }
}
