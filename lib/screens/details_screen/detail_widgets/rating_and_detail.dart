// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/heading_section.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/screens/review_screens/reviews_screen.dart';
import 'package:readmore/readmore.dart';

class RatingAndDetail extends StatelessWidget {
  const RatingAndDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Nike",
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("\$2000", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(Icons.star, color: Colors.amber),
          Text("5.0"),
        ]),
        TextButton(
            onPressed: () => Get.to(ReviewsScreen()), child: Text("Reviews 99"))
      ]),
      SizedBox(height: 12),
      Divider(),
      SizedBox(height: 6),
      Text("Details", style: Theme.of(context).textTheme.titleMedium),
      ReadMoreText(
        st,
        colorClickableText: Theme.of(context).primaryColor,
        trimLines: 2,
        trimMode: TrimMode.Line,
        trimExpandedText: "show less",
        trimCollapsedText: "see more",
      ),
      SizedBox(height: 12),
      Divider()
    ]);
  }
}

var st =
    'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.';
