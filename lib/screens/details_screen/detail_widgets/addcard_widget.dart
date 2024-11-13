// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class AddcardBottomNav extends StatelessWidget {
  const AddcardBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        //width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Icon(Icons.remove_circle, size: 35),
            SizedBox(width: 10),
            Text("10"),
            SizedBox(width: 10),
            Icon(Icons.add_circle, size: 35)
          ]),
          SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.height / 4.5,
              child: ElevatedButton(
                  //autofocus: true,
                  onPressed: () {},
                  child: Text("Add To Cart")))
        ]));
  }
}
