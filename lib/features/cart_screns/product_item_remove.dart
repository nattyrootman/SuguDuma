// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';

class ProuctRemoveItems extends StatelessWidget {
  const ProuctRemoveItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Mycontainer(
            color: Colors.blue,
            height: 30,
            width: 50,
            radius: 10,
            child: TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.minimize,
                ))),
        SizedBox(width: 20),
        Text("2"),
        SizedBox(width: 20),
        Mycontainer(
            color: Colors.blue,
            height: 30,
            width: 50,
            radius: 10,
            child: TextButton(onPressed: () {}, child: Icon(Icons.add)))
      ],
    );
  }
}



//Image.asset("assets/product_images/shoe3.png",