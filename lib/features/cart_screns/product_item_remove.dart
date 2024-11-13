// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProuctRemoveItems extends StatelessWidget {
  const ProuctRemoveItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_circle,
            size: 35,
          ),
        ),
        SizedBox(width: 5),
        Text("24"),
        SizedBox(width: 5),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle,
              size: 35,
            ))
      ],
    );
  }
}



//Image.asset("assets/product_images/shoe3.png",