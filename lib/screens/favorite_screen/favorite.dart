// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/my_grid_view.dart';
import 'package:hope/common_widgets.dart/myproduct_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WhiteList"),
          actions: [Icon(Icons.arrow_forward)],
        ),
        body: SingleChildScrollView(
          child: MyGridView(itemBuilder: (_, int index) => MyproductItemCard()),
        ));
  }
}
