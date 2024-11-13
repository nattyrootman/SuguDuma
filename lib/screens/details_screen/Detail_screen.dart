// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/features/cart_screns/carte_screens.dart';
import 'package:hope/screens/details_screen/detail_widgets/addcard_widget.dart';
import 'package:hope/screens/details_screen/detail_widgets/product_color_size.dart';
import 'package:hope/screens/details_screen/detail_widgets/rating_and_detail.dart';

import 'detail_widgets/detail_headercontainer.dart';

class DetailScreen extends StatelessWidget {
  //String image;
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: AddcardBottomNav(),
        appBar: AppBar(
          actions: [Icon(Icons.favorite)],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: 20),
          ProductDetailHeaderContainer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingAndDetail(),
                SizedBox(height: 24),
                ProductColorAndSize(),
                SizedBox(height: 24),
                Center(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            Get.to(CarteScreens());
                          },
                          child: Center(child: Text("Passer commande")))),
                ),
                SizedBox(height: 24),
              ],
            ),
          )
        ])));
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Mycontainer(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.5,
        child: ElevatedButton(onPressed: () {}, child: Text("Add Card")));
  }
}
