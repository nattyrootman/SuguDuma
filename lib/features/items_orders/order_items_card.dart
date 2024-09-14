// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../common_widgets.dart/mycontainer.dart';
import '../../utiles/colors.dart';

class OrderItemsCard extends StatelessWidget {
  const OrderItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    var d = DateTime.now();
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(5),
          child: Mycontainer(
            width: double.infinity,
            height: 100,
            radius: 10,
            gradient: MyColor.line1,
            child: Stack(
              children: [
                Positioned(
                    top: 8,
                    left: 15,
                    right: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          Icon(Icons.shop),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Process"),
                              Text("${d.day}/${d.month}/${d.year}")
                            ],
                          ),
                        ]),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    )),
                Positioned(
                    bottom: 8,
                    left: 15,
                    child: Row(
                      children: [
                        Icon(Icons.shop),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("Order"), Text("[#555]")],
                        ),
                      ],
                    )),
                Positioned(
                    bottom: 8,
                    right: 25,
                    child: Row(
                      children: [
                        Icon(Icons.shop),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("shipping"),
                            Text("${d.day}/${d.month}/${d.year}")
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          )),
    );
  }
}
