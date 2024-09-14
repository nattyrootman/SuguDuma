import 'package:flutter/material.dart';

import '../../common_widgets.dart/my_grid_view.dart';
import '../../common_widgets.dart/myproduct_card.dart';

class AllProductScreen extends StatelessWidget {
  AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MyGridView(
            iShrink: true,
            itemBuilder: (_, int index) {
              return MyproductItemCard();
            }));
  }
}
