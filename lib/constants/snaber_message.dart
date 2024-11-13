import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarMessage {
  static SuccesMessage() {
    return Get.snackbar(
        "Congratulation", "Your accoaunt has been created succeffully",
        backgroundColor: Colors.green);
  }

  static WarningMessage(String message) {
    return Get.snackbar("Warning", message,
        backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
  }

  static Loading() {}
}
