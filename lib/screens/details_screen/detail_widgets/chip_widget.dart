// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/utiles/colors.dart';

class ChoiceChipeWidget extends StatelessWidget {
  final String label;

  final bool selected;
  final Function(bool)? onSelected;
  final Widget? wig;
  const ChoiceChipeWidget({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    this.wig,
  });

  @override
  Widget build(BuildContext context) {
    final isColor = MyColor.getColor(label) != null;
    return ChoiceChip(
        selected: selected,
        onSelected: onSelected,
        label: MyColor.getColor(label) != null ? SizedBox() : Text(label),
        shape: CircleBorder(),
        labelPadding: isColor ? EdgeInsets.all(0) : null,
        padding: isColor ? EdgeInsets.all(0) : null,
        avatar: Mycontainer(
          height: 50,
          width: 50,
          radius: 100,
          color: MyColor.getColor(label),
        ));
  }
}

class ChoiceChipeWidget1 extends StatelessWidget {
  final String label;

  final bool selected;
  final Function(bool)? onSelected;
  //final Widget? wig;
  const ChoiceChipeWidget1({
    super.key,
    required this.label,
    required this.selected,
    this.onSelected,
    // this.wig,
  });

  @override
  Widget build(BuildContext context) {
    final isColor = MyColor.getColor(label) != null;
    return ChoiceChip(
        selected: selected,
        onSelected: onSelected,
        label: Text(label),
        backgroundColor: isColor ? MyColor.getColor(label)! : null

        //shape: isColor ? CircleBorder() : null,
        //labelPadding: isColor ? EdgeInsets.all(0) : null,
        //padding: isColor ? EdgeInsets.all(0) : null,
        );
  }
}
