import 'package:flutter/material.dart';

class HeadingSectionTtile extends StatelessWidget {
  final String title;
  final bool showBtn;
  final VoidCallback? onPressed;
  final String btnTitle;
  const HeadingSectionTtile(
      {super.key,
      required this.title,
      this.showBtn = false,
      this.onPressed,
      this.btnTitle = "View all"});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        )),
        if (showBtn) TextButton(onPressed: onPressed, child: Text(btnTitle))
      ],
    );
  }
}
