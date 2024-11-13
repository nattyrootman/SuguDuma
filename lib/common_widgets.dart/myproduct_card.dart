// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/screens/details_screen/Detail_screen.dart';

class MyproductItemCard extends StatelessWidget {
  const MyproductItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(DetailScreen()),
      child: Card(
        child: Stack(
          children: [
            Positioned(
                top: 2,
                left: 6,
                child: Mycontainer(
                    width: 50,
                    height: 20,
                    color: Colors.amber,
                    radius: 10,
                    child: Text(
                      "25%",
                      textAlign: TextAlign.center,
                    ))),
            Positioned(
                top: 2,
                right: 5,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                )),
            Positioned(
              top: 30,
              left: 10,
              right: 10,
              bottom: 60,
              child: Mycontainer(
                //
                width: 50,
                height: 85,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/product_images/shoe3.png",
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 8,
                left: 10,
                right: 5,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nike air marks",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$ 2000",
                              style: Theme.of(context).textTheme.bodySmall),
                          Icon(Icons.shopping_cart)
                        ],
                      ),
                    ]))
          ],
        ),
      ),
    );
  }
}
