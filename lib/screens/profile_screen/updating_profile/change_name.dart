import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hope/all_sign_screens/sign_in_screens/sign_screen_in.dart';
import 'package:hope/all_sign_screens/sign_repositories/authentication_repository.dart';
import 'package:hope/all_sign_screens/sign_repositories/user_controller.dart';
import 'package:hope/all_sign_screens/sign_repositories/user_repository.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/constants/snaber_message.dart';
import 'package:hope/screens/profile_screen/profil_infos/profile_info.dart';
import 'package:hope/screens/profile_screen/profil_infos/profile_screen.dart';
import 'package:hope/utiles/colors.dart';
import 'package:hope/utiles/connectivity.dart';

import '../../../all_sign_screens/sign_up/sign_up_screen.dart';
import '../../../utiles/validator_form.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conteroller = Get.put(ChangeNameController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier le Profil"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: conteroller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: conteroller.firstName,
                  validator: (value) => ValidatorUser.ValidedatorName(value),
                  decoration: InputDecoration(
                      hintText: "Name",
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 15),
                Mycontainer(
                    height: 40,
                    width: 170,
                    radius: 5,
                    color: Colors.blue,
                    // gradient: MyColor.line2,
                    child: TextButton(
                        onPressed: () {
                          conteroller.updateUserName();
                        },
                        child: Text(
                          "Sauvegarder",
                          style: TextStyle(color: Colors.white),
                        ))),
                Obx(() => conteroller.isCheck.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text("something wrong"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChangeNameController extends GetxController {
  final userRepository = Get.put(UserRepository());
  final userController = Get.put(UserController());
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<bool> isCheck = false.obs;

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  initializeName() {
    firstName.text = userController.getUser.firstName;
    lastName.text = userController.getUser.lastName;
  }

  void updateUserName() async {
    try {
      final connectivity = await ConnetivityController.instance.isConnect();
      if (!formKey.currentState!.validate()) {
        if (!connectivity) {
          isCheck.value = false;
          return;
        }
        return;
      } else {
        Map<String, dynamic> name = {
          "firstName": firstName.text,
          "lastName": lastName.text
        };

        await userRepository.updateSingleField(name);

        userController.userModel.value.firstName = firstName.text;
        userController.userModel.value.lastName = lastName.text;
        isCheck.value = true;

        Get.to(ProfileModifySceen());
      }
    } catch (e) {
      SnackbarMessage.WarningMessage(e.toString());
      isCheck.value = false;
    }
  }

  void deleUserAccount() async {
    try {
      final auth = AuthenticationRepository.instance.firebaseAuth;

      await UserRepository.instance
          .deteleUserData(auth.currentUser!.uid)
          .whenComplete(() => print("user is deleted"));

      auth.currentUser?.delete().whenComplete(() {
        Navigator.pop(Get.overlayContext!);
        Get.offAll(() => SignUpScreen());
      });
    } catch (e) {
      SnackbarMessage.WarningMessage(e.toString());
    }
  }
}
