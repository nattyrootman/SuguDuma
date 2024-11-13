// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../common_widgets.dart/mycontainer.dart';

class CartItems extends StatelessWidget {
  final Widget? child;
  const CartItems({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(fontSize: 40);

    return Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Mycontainer(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            color: Theme.of(context).cardColor,
            height: 100,
            width: 100,
            radius: 10,
            child: Image.asset(
              "assets/product_images/shoe3.png",
            ),
          ),
          SizedBox(width: 25),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Chaussure",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "Nike",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(height: 5),
                Row(children: [
                  Text("\$200"),
                  SizedBox(width: 35),
                  Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.remove_circle, size: 35)),
                    Text("5"),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add_circle, size: 35))
                  ])
                ])
              ])
        ]);
  }
}
