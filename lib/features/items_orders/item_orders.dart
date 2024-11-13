// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'order_items_card.dart';

class ListItemOrderScreen extends StatelessWidget {
  const ListItemOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var d = DateTime.now();
    return Scaffold(
        appBar: AppBar(title: Text("My Orders"), actions: []),
        body: ListView.separated(
          separatorBuilder: (_, ___) => SizedBox(
            height: 5,
          ),
          itemCount: 5,
          itemBuilder: (_, int index) {
            return OrderItemsCard();
          },
        ));
  }
}
