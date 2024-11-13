import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hope/all_sign_screens/sign_repositories/authentication_repository.dart';
import 'package:hope/constants/snaber_message.dart';
import 'package:hope/models/user_models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final storage = FirebaseStorage.instance;
  final firesStore = FirebaseFirestore.instance;

  Future<void> SaveUseData(UserModel userModel) async {
    try {
      await firesStore
          .collection("Users")
          .doc(userModel.userId)
          .set(userModel.toJson());
    } on FirebaseException catch (e) {
      print(e.message);
    } on PlatformException catch (e) {
      throw '${e.message}';
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserModel> fetchUserDetails() async {
    final userUid =
        AuthenticationRepository.instance.firebaseAuth.currentUser!.uid;
    try {
      final doc = await firesStore.collection("Users").doc(userUid).get();

      if (doc.exists) {
        return UserModel.fromJson(doc);
      } else {
        return UserModel.Empty();
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      Get.snackbar("error", e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      await firesStore
          .collection("Users")
          .doc(userModel.userId)
          .update(userModel.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      Get.snackbar("error", e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await firesStore
          .collection("Users")
          .doc(AuthenticationRepository.instance.firebaseAuth.currentUser!.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      Get.snackbar("error", e.toString());
      throw Exception(e.toString());
    }
  }

  Future<void> deteleUserData(String userId) async {
    try {
      await firesStore.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      Get.snackbar("error", e.toString());
      throw Exception(e.toString());
    }
  }

  Future<String> uPloadImage(String path, XFile image) async {
    try {
      var d = DateTime.now();

      final storageRef = FirebaseStorage.instance.ref(path).child(image.name);
      final meta = SettableMetadata(contentType: "image/jpeg");
      final taskUpload = storageRef.putFile(File(image.path));
      TaskSnapshot taskSnapshot = await taskUpload;
      String url = await taskSnapshot.ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      throw SnackbarMessage.WarningMessage(e.message!);
    } on PlatformException catch (e) {
      throw Exception(e.toString());
    } catch (e) {
      throw SnackbarMessage.WarningMessage(e.toString());
    }
  }

  profile(String path, Uint8List ui) {
    // final image=Ima
  }
}
