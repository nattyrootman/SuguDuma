// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/screens/details_screen/detail_widgets/chip_widget.dart';

class ProductColorAndSize extends StatelessWidget {
  const ProductColorAndSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(spacing: 20, children: [
          Text("Couleurs", style: Theme.of(context).textTheme.titleMedium),
          ChoiceChipeWidget(label: "Green", selected: false),
          ChoiceChipeWidget(label: "Red", selected: true),
          ChoiceChipeWidget(label: "Blue", selected: false)
        ]),
        SizedBox(height: 20),
        Wrap(
          spacing: 20,
          runSpacing: 5,
          children: [
            Text("Sizes", style: Theme.of(context).textTheme.titleMedium),
            ChoiceChipeWidget1(
                label: 'EU 34', selected: true, onSelected: (value) {}),
            ChoiceChipeWidget1(
                label: 'Eu 40', selected: true, onSelected: (value) {}),
            ChoiceChipeWidget1(
                label: 'Eu 45', selected: false, onSelected: (value) {})
          ],
        )
      ],
    );
  }
}
