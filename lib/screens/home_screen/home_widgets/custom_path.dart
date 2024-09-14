import 'package:flutter/material.dart';

class MyCustomCurvPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurv = Offset(0, size.height - 20);
    final lastCurv = Offset(30, size.height - 20);
    path.quadraticBezierTo(
        firstCurv.dx, firstCurv.dy, lastCurv.dx, lastCurv.dy);

    final secondFirst = Offset(0, size.height - 20);
    final secondLast = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(
        secondFirst.dx, secondFirst.dy, secondLast.dx, secondLast.dy);

    final thirdFirst = Offset(size.width, size.height - 20);
    final thirdLast = Offset(size.width, size.height + 20);
    path.quadraticBezierTo(
        thirdFirst.dx, thirdFirst.dy, thirdLast.dx, thirdLast.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
