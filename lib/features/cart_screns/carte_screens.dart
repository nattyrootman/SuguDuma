// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/features/cart_screns/cart_items.dart';
import 'package:hope/features/check_cart_screen/check_scren.dart';
import 'package:hope/utiles/colors.dart';

import 'product_item_remove.dart';

class CarteScreens extends StatelessWidget {
  const CarteScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckCart"),
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, int index) {
              return Card(
                  child: CartItems(
                child: ProuctRemoveItems(),
              ));
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Mycontainer(
            padding: EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width / 1.5,
            height: 50,
            gradient: MyColor.line1,
            radius: 10,
            child: TextButton(
                onPressed: () => Get.to(CheckScreen()),
                child: Text("\$15645",
                    style: TextStyle(color: Colors.white, fontSize: 24)))),
      ),
    );
  }
}
