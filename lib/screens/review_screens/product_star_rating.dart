import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductStarRaing extends StatelessWidget {
  const ProductStarRaing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RatingController());
    return Obx(() => RatingBar(
        initialRating: controller.currentIndex.value,
        maxRating: 5,
        filledIcon: Icons.star,
        emptyIcon: Icons.star_half,
        size: 26,
        onRatingChanged: (value) {
          controller.getRatting(value);
        }));
  }
}

class RatingController extends GetxController {
  Rx<double> currentIndex = 0.0.obs;

  getRatting(double value) {
    currentIndex.value = value;
  }
}
