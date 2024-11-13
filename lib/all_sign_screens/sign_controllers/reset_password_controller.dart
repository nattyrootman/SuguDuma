import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/all_sign_screens/sign_in_screens/sign_screen_in.dart';
import 'package:hope/all_sign_screens/sign_repositories/authentication_repository.dart';

import '../../constants/snaber_message.dart';
import '../../utiles/connectivity.dart';
import '../../utiles/fullscreen_loader.dart';
import '../sign_in_screens/reset_password_screen.dart';

class ResetPasswordController extends GetxController {
  static ResetPasswordController get Instance => Get.find();

  TextEditingController email = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void SendPassWord() async {
    try {
      ScreenLoader.MyLoader(
          "waiting loading...", "assets/myjons/animation1.json");

      final connectivity = await ConnetivityController.instance.isConnect();
      if (!connectivity) {
        Navigator.pop(Get.overlayContext!);
        return;
      }

      if (!formKey.currentState!.validate()) {
        Navigator.pop(Get.overlayContext!);
        return;
      }

      await AuthenticationRepository.instance
          .ResetPassword(email.text.trim())
          .whenComplete(
              () => Get.to(PasswordSentScreen(email: email.text.trim())));
      Navigator.pop(Get.overlayContext!);
      SnackbarMessage.WarningMessage("reset password message has been sent");
      Get.to(ResetPassWordScreen(email: email.text.trim()));
    } catch (e) {
      Navigator.pop(Get.overlayContext!);
      print("something is wrong  ${e.toString()}");
      SnackbarMessage.WarningMessage(e.toString());
    }
  }

  resendPassWord(String email) async {
    try {
      ScreenLoader.MyLoader(
          "waiting loading...", "assets/myjons/animation3.json");

      final connectivity = await ConnetivityController.instance.isConnect();
      if (!connectivity) {
        Navigator.pop(Get.overlayContext!);
        return;
      }

      if (!formKey.currentState!.validate()) {
        Navigator.pop(Get.overlayContext!);
        return;
      }

      await AuthenticationRepository.instance.ResetPassword(email);

      SnackbarMessage.WarningMessage('email has been sent');
    } catch (e) {
      SnackbarMessage.WarningMessage(e.toString());
    }
  }
}

class PasswordSentScreen extends StatelessWidget {
  final String? email;
  const PasswordSentScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      Image.asset("assets/sign_up_images/shop1.png"),
      Text(
          "If you didn’t request this change, please ignore this message. Your account remains secure."),
      TextButton(
          onPressed: () => Get.offAll(() => SignInScreen()),
          child: Text("Done")),
      TextButton(
          onPressed: () =>
              ResetPasswordController.Instance.resendPassWord(email ?? ""),
          child: Text("Resend Password"))
    ])));
  }
}
