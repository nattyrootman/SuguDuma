import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  final int itemCount;
  final bool iShrink;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double mainAxisExtent;

  final Widget Function(BuildContext, int) itemBuilder;
  const MyGridView(
      {super.key,
      this.itemCount = 10,
      this.iShrink = false,
      required this.itemBuilder,
      this.mainAxisSpacing = 5,
      this.crossAxisSpacing = 0,
      this.mainAxisExtent = 300});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: iShrink,
        physics: ScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
