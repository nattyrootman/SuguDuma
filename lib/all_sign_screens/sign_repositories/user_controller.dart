import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:hope/all_sign_screens/sign_repositories/user_repository.dart';
import 'package:hope/constants/snaber_message.dart';
import 'package:hope/models/user_models/user_model.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  Rx<UserModel> userModel = UserModel.Empty().obs;
  final userRepository = Get.put(UserRepository());

  UserModel get getUser => userModel.value;
  @override
  void onInit() {
    super.onInit();
    fechUserData();
  }

  fechUserData() async {
    try {
      final user = await userRepository.fetchUserDetails();
      userModel(user);
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
  }

  Future<void> saveUserWithGoogSign(UserCredential? credential) async {
    await fechUserData();
    try {
      if (userModel.value.userId.isNotEmpty) {
        if (credential != null) {
          var userModel = UserModel(
              userId: credential.user!.uid,
              firstName: credential.user!.displayName ?? "",
              lastName: credential.user!.displayName ?? "",
              email: credential.user!.email ?? "",
              phoneNumber: credential.user!.phoneNumber ?? "",
              profilePhoto: credential.user!.photoURL ?? "");

          await userRepository.SaveUseData(userModel);
        }
      }
    } catch (e) {
      SnackbarMessage.WarningMessage("something went, wrong data not saved");
    }
  }

  void userProfile() async {
    try {
      final pickImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickImage != null) {
        //final img = await pickImage.readAsBytes();
        final imageUrl =
            await userRepository.uPloadImage("Users/Images/Profile", pickImage);

        Map<String, dynamic> json = {"profilePhoto": imageUrl};

        userModel.value.profilePhoto = imageUrl;

        await userRepository.updateSingleField(json).whenComplete(() =>
            SnackbarMessage.WarningMessage("your picture has been updated!"));
      }
    } on FirebaseException catch (e) {
      SnackbarMessage.WarningMessage(e.message!);
    } on FileSystemException catch (e) {
      SnackbarMessage.WarningMessage(e.message);
    } catch (e) {
      print(e.toString());
      SnackbarMessage.WarningMessage(e.toString());
    }
  }
}
