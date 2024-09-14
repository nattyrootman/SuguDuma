// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../common_widgets.dart/mycontainer.dart';
import 'linear_progress_rating.dart';
import 'product_rating.dart';
import 'product_star_rating.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingController());
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(st),
            ProductRatingReview(),
            ProductStarRaing(),
            SizedBox(height: 25),
            ProductRatingViewUser(),
            ProductRatingViewUser(),
            ProductRatingViewUser()
          ],
        ),
      ),
    );
  }
}

var st = "tjis is fluter dev ap";

class ProductRatingViewUser extends StatelessWidget {
  const ProductRatingViewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        // width: double.infinity,
        //radius: 10,
        color: Theme.of(context).cardColor,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Row(children: [
                Mycontainer(
                  width: 60,
                  height: 60,
                  color: Theme.of(context).unselectedWidgetColor,
                  radius: 100,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset("assets/product_images/shoe3.png",
                          height: 50, width: 50, fit: BoxFit.cover)),
                ),
                Text("Change Profile"),
              ]),
              Icon(Icons.more_vert)
            ]),
            Row(
              children: [
                ProductStarRaing(),
                SizedBox(
                  width: 20,
                ),
                Text(date)
              ],
            ),
            SizedBox(
              height: 24,
            ),
            ReadMoreText(
              s,
              colorClickableText: Theme.of(context).primaryColor,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: "show less",
              trimCollapsedText: "see more",
            ),
          ],
        ),
      ),
      SizedBox(height: 40),
      Container(
        color: Theme.of(context).hoverColor,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                "Sugu Duma",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(date)
            ]),
            ReadMoreText(
              s,
              colorClickableText: Theme.of(context).primaryColor,
              trimLines: 2,
              trimMode: TrimMode.Line,
              trimExpandedText: "show less",
              trimCollapsedText: "see more",
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    ]);
  }
}

var date =
    "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";

var s = """following assertion was thrown resolving an image codec:
Unable to load asset: "assets/categorie_images/shoe3.jpg".
The asset does not exist or has empty data.""";
