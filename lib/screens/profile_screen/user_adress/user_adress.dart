// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/utiles/colors.dart';

import '../../home_screen/home_screen.dart';
import 'add_adress.dart';

class UserAdress extends StatelessWidget {
  const UserAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adress"),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [AdressCard(check: true), AdressCard(check: true)],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddAdress()),
        child: Icon(Icons.add),
      ),
    );
  }
}

class AdressCard extends StatelessWidget {
  final bool check;
  const AdressCard({
    super.key,
    required this.check,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = Get.put(ThemeController());

    bool isDark = MyColor.isDarkMode(context);
    return Mycontainer(
        radius: 10,
        width: double.infinity,
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.symmetric(vertical: 10),
        color: check
            ? Theme.of(context).focusColor
            : isDark
                ? Theme.of(context).focusColor.withOpacity(0.2)
                : Theme.of(context).focusColor.withRed(255),
        child: Stack(children: [
          Positioned(right: 5, child: Icon(check ? Icons.tiktok : null)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Boston usa "),
              Text(
                "45547888",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Text("America ,city Boston ")
            ],
          )
        ]));
  }
}
