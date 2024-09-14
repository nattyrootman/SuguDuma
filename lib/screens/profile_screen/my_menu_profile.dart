import 'package:flutter/material.dart';

class MyMenuProfile extends StatelessWidget {
  final String title;
  final String value;
  final IconData iconData;
  final VoidCallback onPressed;

  MyMenuProfile(
      {super.key,
      required this.title,
      required this.value,
      this.iconData = Icons.arrow_forward,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                child: Text(value,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                child: IconButton(
              onPressed: onPressed,
              icon: Icon(iconData),
            ))
          ],
        ),
      ),
    );
  }
}
