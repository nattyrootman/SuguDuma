// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';

class AddcardBottomNav extends StatelessWidget {
  const AddcardBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Mycontainer(
                padding: EdgeInsets.all(8.0),
                height: 40,
                width: 40,
                radius: 100,
                color: Colors.blue,
                child: Icon(
                  Icons.minimize_rounded,
                )),
            SizedBox(width: 15),
            Text("2"),
            SizedBox(width: 15),
            Mycontainer(
                height: 40,
                width: 40,
                radius: 100,
                color: Colors.blue,
                child: Icon(Icons.add)),
          ]),
          SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.height / 4,
              child: ElevatedButton(
                  autofocus: true,
                  onPressed: () {},
                  child: Text("Add To Cart")))
        ]));
  }
}
