// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/bottom_nav_bar/hosting_screens.dart';

import '../../common_widgets.dart/heading_section.dart';
import '../../common_widgets.dart/mycontainer.dart';
import '../../utiles/colors.dart';

class CheckBillingSection extends StatelessWidget {
  const CheckBillingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingSectionTtile(title: "Payment Methods", btnTitle: "Change"),
        Row(
          children: [
            Icon(Icons.paypal_rounded, color: Colors.blue),
            SizedBox(
              width: 16,
            ),
            Expanded(child: Text("PayPal"))
          ],
        ),
        HeadingSectionTtile(title: "Shopping Adress", btnTitle: "Change"),
        Text("Sugu Duma"),
        Row(children: [Icon(Icons.phone), Expanded(child: Text("+234558888"))]),
        Row(children: [
          Icon(Icons.location_history),
          Expanded(child: Text("Rue Sugu 4555"))
        ])
      ],
    );
  }
}

class SucessScreen extends StatelessWidget {
  final Widget widget;
  final String title;
  final String subTitle;
  final VoidCallback onPress;

  const SucessScreen(
      {super.key,
      required this.widget,
      required this.title,
      required this.subTitle,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Container(child: widget),
                SizedBox(height: 24),
                Text(title),
                SizedBox(height: 5),
                Text(subTitle),
                SizedBox(height: 32),
                ElevatedButton(onPressed: onPress, child: Text("Save"))
              ]))),
    );
  }
}
