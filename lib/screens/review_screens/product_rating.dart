// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'linear_progress_rating.dart';

class ProductRatingReview extends StatelessWidget {
  const ProductRatingReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 3,
          child: Text(
            "4.8",
            style: Theme.of(context).textTheme.displayLarge,
          )),
      Expanded(
        flex: 7,
        child: Column(
          children: [
            LinearProgressRating(text: "5", value: 1.0),
            LinearProgressRating(text: "4", value: 0.8),
            LinearProgressRating(text: "3", value: 0.6),
            LinearProgressRating(text: "2", value: 0.4),
            LinearProgressRating(text: "1", value: 0.2)
          ],
        ),
      )
    ]);
  }
}
