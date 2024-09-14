// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';

class MyImageRound extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final double radius;

  const MyImageRound({
    super.key,
    required this.image,
    this.height = 85,
    this.width = 180,
    this.radius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Mycontainer(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(2),
      width: width,
      height: height,
      radius: 5,
      color: Theme.of(context).focusColor,
      child: Image.asset(
        image,
        //fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width / 1.2,

        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
