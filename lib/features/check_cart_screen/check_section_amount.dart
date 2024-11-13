// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../common_widgets.dart/mycontainer.dart';
import '../../utiles/mytext_field.dart';
import '../cart_screns/cart_items.dart';

class CheckSectionAmount extends StatelessWidget {
  const CheckSectionAmount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CartItems(),
        Row(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: MyTextField(text: "Have Promo Enter ")),
            Expanded(
                // flex: 1,
                child: Mycontainer(
                    color: Theme.of(context).cardColor,
                    radius: 10,
                    height: 50,
                    width: 70,
                    child: TextButton(onPressed: () {}, child: Text("Apply"))))
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("total:"),
            Text("\$5774"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("shopping fee:"),
            Text("\$0.64"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax fee:"),
            Text("\$2.64"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order:"),
            Text("\$6.64"),
          ],
        ),
        //CheckBillingSection(),
      ],
    );
  }
}
