import 'package:flutter/material.dart';

class LinearProgressRating extends StatelessWidget {
  final String text;
  final double value;
  const LinearProgressRating({
    super.key,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(text)),
        Expanded(
          flex: 10,
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey,
              minHeight: 10,
              value: value,
              borderRadius: BorderRadius.circular(10),
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}
