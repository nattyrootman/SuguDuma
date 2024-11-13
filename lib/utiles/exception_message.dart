import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hope/constants/snaber_message.dart';

class AuthException implements Exception {
  final String code;
  final String message;

  AuthException(this.code, this.message);

  @override
  String toString() {
    return 'AuthException: [$code] $message';
  }

  static AuthException mapFirebaseAuthExceptionToAuthException(
      FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return AuthException(
            e.code, 'The email address is already in use by another account.');
      case 'invalid-email':
        return AuthException(e.code, 'The email address is badly formatted.');
      case 'weak-password':
        return AuthException(e.code, 'The password is too weak.');
      case 'user-not-found':
        return AuthException(e.code,
            'There is no user record corresponding to this identifier.');
      case 'wrong-password':
        return AuthException(e.code,
            'The password is invalid or the user does not have a password.');
      case 'user-disabled':
        return AuthException(
            e.code, 'The user account has been disabled by an administrator.');
      case 'operation-not-allowed':
        return AuthException(
            e.code, 'Email/password accounts are not enabled.');
      case 'too-many-requests':
        return AuthException(e.code,
            'We have blocked all requests from this device due to unusual activity.');
      case 'network-request-failed':
        return AuthException(
            e.code, 'A network error occurred. Check your connection.');
      // Add other cases as necessary
      default:
        return AuthException(
            e.code, 'An unexpected error occurred: ${e.message}');
    }
  }
}
