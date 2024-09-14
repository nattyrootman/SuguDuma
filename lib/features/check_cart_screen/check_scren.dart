// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/features/cart_screns/cart_items.dart';
import 'package:hope/features/cart_screns/product_item_remove.dart';
import 'package:hope/features/check_cart_screen/check_billing_section.dart';
import 'package:hope/utiles/colors.dart';
import 'package:hope/utiles/mytext_field.dart';

import '../../bottom_nav_bar/hosting_screens.dart';
import '../../common_widgets.dart/heading_section.dart';
import '../../common_widgets.dart/mycontainer.dart';
import 'check_section_amount.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Rveiw"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [CheckSectionAmount(), Divider(), CheckBillingSection()],
          ),
        ),
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
                onPressed: () => Get.to(SucessScreen(
                    widget: Icon(Icons.receipt),
                    title: "Payment success",
                    subTitle: "your item will be snipped",
                    onPress: () => Get.offAll(() => HostingScreen()))),
                child: Text("\$15645",
                    style: TextStyle(color: Colors.white, fontSize: 24)))),
      ),
    );
  }
}
