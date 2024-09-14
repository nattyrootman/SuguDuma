// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/screens/home_screen/home_screen.dart';
import 'package:hope/common_widgets.dart/my_image_rounded.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyCarouselController());
    return Column(children: [
      SizedBox(
        height: 120,
        child: CarouselSlider(
            options: CarouselOptions(
                height: 400,
                onPageChanged: (index, _) {
                  controller.updateCurrentIndex(index);
                },
                viewportFraction: 0.6,
                autoPlay: true),
            items: [
              MyImageRound(image: "assets/product_images/elec1.png"),
              MyImageRound(image: "assets/product_images/cloth2.png"),
              MyImageRound(image: "assets/product_images/shoe2.png")
            ]),
      ),
      SizedBox(height: 5),
      Obx(() => Row(
            children: [
              for (int i = 0; i < 3; i++)
                Mycontainer(
                  //padding: EdgeInsets.all(2.0),
                  margin: EdgeInsets.only(left: 8.0),
                  height: 10,
                  width: 10,
                  radius: 50,
                  color: controller.currentIndex.value == i
                      ? Colors.grey
                      : Colors.blue,
                )
            ],
          ))
    ]);
  }
}

class MyCarouselController extends GetxController {
  static CarouselController get instance => Get.find();

  Rx<int> currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
