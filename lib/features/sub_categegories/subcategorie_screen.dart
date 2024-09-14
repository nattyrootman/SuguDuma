// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/common_widgets.dart/myproduct_card.dart';
import 'package:hope/screens/home_screen/home_widgets/my_carousel.dart';
import 'package:hope/utiles/colors.dart';

import '../../common_widgets.dart/my_grid_view.dart';
import '../../common_widgets.dart/my_image_rounded.dart';
import '../../common_widgets.dart/myhorizontal_list.dart';

class SubcategoryScreen extends StatelessWidget {
  SubcategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chausures"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              SizedBox(height: 25),
              Center(
                child: Mycontainer(
                  gradient: MyColor.line1,
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 150,
                  radius: 5,
                  child: Image.asset(
                    "assets/product_images/shoe3.png",
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MyGridView(
                  iShrink: true,
                  itemBuilder: (_, int index) {
                    return MyproductItemCard();
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class SubCategoryItemCard extends StatelessWidget {
  const SubCategoryItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
