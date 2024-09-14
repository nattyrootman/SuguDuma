import 'package:flutter/material.dart';

class MyNestedScrollview extends StatelessWidget {
  final List<Widget> Function(BuildContext, bool) headerSliverBuilder;
  final Widget body;
  const MyNestedScrollview(
      {super.key, required this.headerSliverBuilder, required this.body});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: headerSliverBuilder, body: body);
  }
}
