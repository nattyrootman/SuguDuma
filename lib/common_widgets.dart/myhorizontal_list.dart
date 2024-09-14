import 'package:flutter/material.dart';

class MyhorizontalList extends StatelessWidget {
  final int itemCount;
  final bool iShrink;
  final Widget Function(BuildContext, int) itemBuilder;
  const MyhorizontalList(
      {super.key,
      this.itemCount = 10,
      this.iShrink = true,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        shrinkWrap: iShrink,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: itemBuilder);
  }
}
