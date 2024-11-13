import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/constants/snaber_message.dart';
import 'package:hope/models/user_models/user_model.dart';
import 'package:hope/all_sign_screens/sign_repositories/authentication_repository.dart';
import 'package:hope/all_sign_screens/sign_repositories/user_repository.dart';
import 'package:hope/utiles/exception_message.dart';

import '../../utiles/connectivity.dart';
import '../../utiles/fullscreen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  //late final Rx<User> _user;

  final isHidden = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final passWord = TextEditingController();
  final authentRepo = AuthenticationRepository.instance;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void SignUp() async {
    try {
      final userRepository = Get.put(UserRepository());
      final connexion = await ConnetivityController.instance.isConnect();
      ScreenLoader.MyLoader("Chargment...", "assets/myjons/animation1.json");

      if (!connexion) {
        return;
      }

      if (!formKey.currentState!.validate()) {
        Navigator.pop(Get.overlayContext!);
        return;
      }

      var user = await authentRepo.RegisterEmailAndPassWord(
          email.text.trim(), passWord.text.trim());

      final UserModel userModel = UserModel(
          userId: user.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          passWord: passWord.text.trim(),
          profilePhoto: "");

      await userRepository.SaveUseData(userModel);
      SnackbarMessage.SuccesMessage();
    } on AuthException catch (e) {
      Navigator.pop(Get.overlayContext!);
      SnackbarMessage.WarningMessage(e.message);
    } catch (e) {
      Navigator.pop(Get.overlayContext!);
      SnackbarMessage.WarningMessage(e.toString());
    }
  }

  void Logout() async {
    await AuthenticationRepository.instance.firebaseAuth.signOut();
  }
}
