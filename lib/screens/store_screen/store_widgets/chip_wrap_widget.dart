import 'package:flutter/material.dart';

class ChipWrapWidget extends StatelessWidget {
  const ChipWrapWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      alignment: WrapAlignment.spaceEvenly,
      // // runAlignment: WrapAlignment.spaceAround,
      spacing: 5,
      runSpacing: 15,
      children: [
        Chip(
          labelPadding: EdgeInsets.all(8),
          label: Text("Shoe"),
        ),
        Chip(labelPadding: EdgeInsets.all(8), label: Text("Cloth")),
        Chip(labelPadding: EdgeInsets.all(8), label: Text("Habillement")),
        Chip(labelPadding: EdgeInsets.all(8), label: Text("Electronic")),
        Chip(labelPadding: EdgeInsets.all(8), label: Text("Meuble")),
        Chip(labelPadding: EdgeInsets.all(8), label: Text("Bijouterie"))
      ],
    );
  }
}
