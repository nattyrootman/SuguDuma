import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String userId;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  final String? passWord;
  String profilePhoto;

  UserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    this.passWord,
    required this.profilePhoto,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'passWord': passWord,
      'profilePhoto': profilePhoto,
    };
  }

  // Create a UserModel instance from a Map
  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> doc) {
    var json = doc.data()!;
    return UserModel(
      userId: json['userId'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      passWord: json['passWord'] ?? '',
      profilePhoto: json['profilePhoto'] ?? '',
    );
  }

  factory UserModel.Empty() {
    return UserModel(
        userId: "",
        firstName: "",
        lastName: "",
        email: "",
        phoneNumber: "",
        passWord: "",
        profilePhoto: "");
  }
}
