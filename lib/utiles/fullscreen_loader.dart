// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ScreenLoader {
  static MyLoader(String text, String animation) {
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Dialog.fullscreen(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Text(text),
                      SizedBox(height: 230, child: Lottie.asset(animation)),
                      // CircularProgressIndicator()
                    ],
                  ),
                ),
              ),
            )));
  }
}

class LoaderAnimation extends StatelessWidget {
  final String text;
  final String? textAnimation;
  final bool showAcion;
  final String? textAction;
  final VoidCallback? onPress;
  const LoaderAnimation(
      {super.key,
      required this.text,
      required this.textAnimation,
      this.showAcion = true,
      this.textAction,
      this.onPress});

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context).size.width * 0.8;
    return Center(
      child: Column(
        children: [
          Lottie.asset(textAnimation!, height: 100),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 24),
          showAcion
              ? SizedBox(
                  width: 240,
                  child: OutlinedButton(
                      onPressed: () {}, child: Text(textAction!)))
              : const SizedBox()
        ],
      ),
    );
  }
}
