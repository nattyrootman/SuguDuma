import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/constants/constant.dart';

class VerticalItemCard extends StatelessWidget {
  final int index;
  final VoidCallback onTap;
  const VerticalItemCard({
    super.key,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Mycontainer(
            margin: EdgeInsets.only(left: 8.0),
            color: Theme.of(context).cardColor,
            width: 60,
            height: 60,
            radius: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child:
                  Image.asset(horizontalItem[index].image, fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5),
          Text(horizontalItem[index].name)
        ],
      ),
    );
  }
}
