import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hope/constants/snaber_message.dart';
import 'package:hope/utiles/exception_message.dart';
import '../../bottom_nav_bar/hosting_screens.dart';
import '../sign_up/sign_up_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  var deviceStorage = GetStorage();
  final firebaseAuth = FirebaseAuth.instance;
  late Rx<User?> _user;
  User get MyUser => _user.value!;

  @override
  onReady() {
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, userInitializer);
  }

  userInitializer(User? user) {
    if (user == null) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(() => SignUpScreen());
      });
    } else {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAll(() => HostingScreen());
      });
    }
  }

  Future<UserCredential> RegisterEmailAndPassWord(
      String email, String password) async {
    try {
      return await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw Exception('FirebaseAuthException: ${e.message}');
    } on PlatformException catch (e) {
      print("PlatForme ${e.message}");

      throw Exception('${e.message}');
    } catch (e) {
      throw Exception(" Somthing went wrong");
    }
  }

  Future<UserCredential> SignEmailAndPassword(
      String email, String password) async {
    try {
      return await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException.mapFirebaseAuthExceptionToAuthException(e);
    } on FormatException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw throw Exception("Somthing went wrong");
    }
  }

  Future<UserCredential> GoogleSigning() async {
    try {
      final GoogleSignInAccount? userGoogleAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userGoogleAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw AuthException.mapFirebaseAuthExceptionToAuthException(e);
    } on PlatformException catch (e) {
      throw SnackbarMessage.WarningMessage(e.message!);
    } on FormatException catch (e) {
      throw SnackbarMessage.WarningMessage(e.message);
    } catch (e) {
      throw SnackbarMessage.WarningMessage(e.toString());
    }
  }

  Future<void> ResetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw throw AuthException.mapFirebaseAuthExceptionToAuthException(e);
    } on FormatException catch (e) {
      print(e.message);
      //throw  myMessageException(e.message);
    } catch (e) {
      //if (kDebugMode) print("something is wrong  ${e.toString()}");
      throw SnackbarMessage.WarningMessage(e.toString());
    }
  }
}
