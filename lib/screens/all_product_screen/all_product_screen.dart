import 'package:flutter/material.dart';

import '../../common_widgets.dart/my_grid_view.dart';
import '../../common_widgets.dart/myproduct_card.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tous Les Produits"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                DropdownButtonFormField(
                  //borderRadius: BorderRadius.circular(10),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.sort), border: InputBorder.none),
                  onChanged: (value) {},
                  items: [
                    "Nom",
                    "Prix élevé",
                    "Prix bas",
                    "Populaire",
                    "Nouvelle"
                  ]
                      .map((element) => DropdownMenuItem(
                          value: element, child: Text(element)))
                      .toList(),
                ),
                SizedBox(height: 16),
                MyGridView(
                    iShrink: true,
                    itemBuilder: (_, int index) {
                      return MyproductItemCard();
                    }),
              ],
            ),
          ),
        ));
  }
}
