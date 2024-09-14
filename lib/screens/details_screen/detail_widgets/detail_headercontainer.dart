// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/constants/constant.dart';

class ProductDetailHeaderContainer extends StatelessWidget {
  const ProductDetailHeaderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(children: [
        Positioned(
            top: 2,
            left: 2,
            right: 2,
            child: Mycontainer(
              radius: 10,
              //width: 150,
              height: 200,
              color: Theme.of(context).focusColor,
              child: Image.asset("assets/product_images/shoe4.png"),
            )),
        Positioned(
            bottom: 2,
            left: 5,
            right: 5,
            child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: horizontalItem.length,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(
                    height: 24,
                  ),
                  itemBuilder: (_, index) {
                    return Mycontainer(
                        radius: 10,
                        height: 50,
                        width: 60,
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.all(2.0),
                        color: Theme.of(context).focusColor,
                        child: Image.asset(horizontalItem[index].image));
                  },
                )))
      ]),
    );
  }
}




/*return Mycontainer(
                        radius: 10,
                        height: 50,
                        width: 60,
                        margin: EdgeInsets.all(4.0),
                        padding: EdgeInsets.all(2.0),
                        color: Theme.of(context).hintColor,
                        child: Image.asset(horizontalItem[index].image));*/