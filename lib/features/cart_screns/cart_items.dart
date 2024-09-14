// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'product_item_remove.dart';

class CartItems extends StatelessWidget {
  final Widget? child;
  const CartItems({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 40);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset("assets/product_images/shoe3.png", height: 150, width: 130),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text("Nike Pro APpp"),
                Icon(
                  Icons.check_box,
                  color: Colors.blue,
                )
              ],
            ),
            SizedBox(height: 10),
            Text("Color/Blue"),
            SizedBox(height: 5),
            Text("Size/25"),
            SizedBox(height: 5),
            Text("200 eur"),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: child,
            )
          ],
        ),
      ],
    );
  }
}
