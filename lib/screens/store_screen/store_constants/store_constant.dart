// ignore_for_file: prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:hope/common_widgets.dart/my_grid_view.dart';

import '../../../common_widgets.dart/myproduct_card.dart';

class StoreConstant {
  static const List<Widget> tabs = [
    Text("Chaussure"),
    Text("Habillement"),
    Text("Electronic"),
    Text("Meuble"),
    Text("Sport"),
    Text("Bijouterie")
  ];

  static List<Widget> tabView = [
    MyGridView(itemBuilder: (_, int index) => MyproductItemCard()),
    Text("Habillement"),
    Text("Electronic"),
    Text("Meuble"),
    Text("Sport"),
    Text("Bijouterie")
  ];
}
