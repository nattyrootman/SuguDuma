import 'package:flutter/material.dart';

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
        onChanged: (value) {
          if (value.isEmpty) {
            value = "écrire quelque chose";
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).cardColor,
          //  contentPadding: EdgeInsets.only(left: 10, top: 0, bottom: 0),
          hintText: text,
          suffixIcon: suffix,
          prefix: prefix,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Theme.of(context).focusColor)),
        ),
      ),
    );
  }
}
