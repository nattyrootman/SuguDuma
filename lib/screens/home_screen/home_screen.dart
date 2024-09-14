// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hope/common_widgets.dart/heading_section.dart';
import 'package:hope/common_widgets.dart/my_grid_view.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/common_widgets.dart/myhorizontal_list.dart';
import 'package:hope/common_widgets.dart/myproduct_card.dart';
import 'package:hope/screens/home_screen/home_widgets/my_carousel.dart';
import 'package:hope/common_widgets.dart/my_image_rounded.dart';
import 'package:hope/themes/mytheme.dart';
import 'package:hope/utiles/colors.dart';
import 'package:hope/utiles/mytext_field.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';

import '../../constants/constant.dart';
import '../../features/sub_categegories/subcategorie_screen.dart';
import 'home_widgets/custom_path.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // CarouselController? controller;
  int currentIndex = 0;
  var isDark = false;
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SuguDuma",
        ),
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
                              themeController.isDar.value =
                                  !themeController.isDar.value;
                            },
                            child: Icon(themeController.isDar.value
                                ? Icons.dark_mode
                                : Icons.light_mode))),
                    Positioned(right: 5, child: Icon(Icons.add_shopping_cart))
                  ],
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                        style: Theme.of(context).textTheme.titleMedium),
                    MyCarouselSlider(),
                    SizedBox(height: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Popular Categories",
                            style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 5),
                        SizedBox(
                          height: 100,
                          child: MyhorizontalList(
                              itemCount: horizontalItem.length,
                              itemBuilder: (_, int index) {
                                return VerticalItemCard(
                                    index: index,
                                    onTap: () => Get.to(SubcategoryScreen()));
                              }),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              HeadingSectionTtile(
                  title: 'All Products', showBtn: true, onPressed: () {}),
              MyGridView(
                  iShrink: true,
                  itemBuilder: (_, int index) {
                    return MyproductItemCard();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class VerticalItemCard extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  const VerticalItemCard({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Mycontainer(
            margin: EdgeInsets.only(left: 8.0),
            color: Theme.of(context).cardColor,
            width: 60,
            height: 60,
            radius: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child:
                  Image.asset(horizontalItem[index].image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5),
          Text(horizontalItem[index].name)
        ],
      ),
    );
  }
}

class ThemeController extends GetxController {
  Rx<bool> isDar = true.obs;

  getTheme() {
    return isDar.value ? MythemeData.darkThemData : MythemeData.ligthThem;
  }
}
