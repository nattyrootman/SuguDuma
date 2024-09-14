import 'package:flutter/material.dart';
import 'package:hope/constants/constant.dart';
import 'package:hope/themes/mytheme.dart';

class MyTextField extends StatelessWidget {
  final String text;
  final Widget? prefix;
  final Widget? suffix;
  const MyTextField({super.key, required this.text, this.prefix, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: !themeController.isDar.value
              ? Theme.of(context).focusColor
              : Theme.of(context).cardColor,
          //  contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
          hintText: text,
          suffixIcon: suffix,
          prefix: prefix,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide()),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
