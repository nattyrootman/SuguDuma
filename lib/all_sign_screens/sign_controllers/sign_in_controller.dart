import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hope/constants/snaber_message.dart';
import 'package:hope/all_sign_screens/sign_repositories/authentication_repository.dart';
import 'package:hope/utiles/exception_message.dart';

import '../../utiles/connectivity.dart';
import '../../utiles/fullscreen_loader.dart';

class SignInController extends GetxController {
  final localStorage = GetStorage();
  final ishidden = true.obs;
  final remember = false.obs;
  final email = TextEditingController();
  final passWord = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (remember.value) {
      email.text = localStorage.read("remember_email");
      passWord.text = localStorage.read("rememer_password");
    }

    super.onInit();
  }

  Future<void> EmailAndPasswordLogin() async {
    try {
      final authRepository = AuthenticationRepository.instance;
      final connectivity = await ConnetivityController.instance.isConnect();

      ScreenLoader.MyLoader("Chargment...", "assets/myjons/animation1.json");
      if (!connectivity) {
        return;
      }
      if (!formKey.currentState!.validate()) {
        Navigator.pop(Get.overlayContext!);
        return;
      }

      if (!remember.value) {
        localStorage.write("remember_email", email.text.trim());
        localStorage.write("rememer_password", passWord.text.trim());
      }

      await authRepository.SignEmailAndPassword(
          email.text.trim(), passWord.text.trim());
    } on AuthException catch (e) {
      SnackbarMessage.WarningMessage(e.message);
      Navigator.pop(Get.overlayContext!);
    } catch (e) {
      SnackbarMessage.WarningMessage(e.toString());
      Navigator.pop(Get.overlayContext!);
    }
  }

  Future<void> LoginWithGoogle() async {
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

      if (!remember.value) {
        localStorage.write("remember_email", email.text.trim());
        localStorage.write("rememer_password", passWord.text.trim());
      }

      AuthenticationRepository.instance
          .GoogleSigning()
          .whenComplete(() => Navigator.pop(Get.overlayContext!));
    } on AuthException catch (e) {
      Navigator.pop(Get.overlayContext!);
      SnackbarMessage.WarningMessage(e.message);
    } catch (e) {
      Navigator.pop(Get.overlayContext!);
      SnackbarMessage.WarningMessage(e.toString());
    }
  }
}
