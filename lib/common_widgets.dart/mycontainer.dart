import 'package:flutter/material.dart';

class Mycontainer extends StatelessWidget {
  final double? height, width;

  final EdgeInsetsGeometry? margin, padding;
  final Color? color;
  final double radius;
  final LinearGradient? gradient;
  final Widget? child;
  final Border? border;

  const Mycontainer(
      {super.key,
      this.height,
      this.width,
      this.margin,
      this.padding,
      this.color,
      this.radius = 0,
      this.gradient,
      this.child,
      this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
          color: color,
          gradient: gradient,
          borderRadius: BorderRadius.circular(radius),
          border: border),
      child: child,
    );
  }
}
