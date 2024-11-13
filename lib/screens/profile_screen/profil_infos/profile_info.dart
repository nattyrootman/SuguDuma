import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/screens/profile_screen/profil_infos/my_menu_profile.dart';
import 'package:hope/utiles/mytext_field.dart';

import '../../../all_sign_screens/sign_repositories/user_controller.dart';
import '../updating_profile/change_name.dart';

var url =
    "https://firebasestorage.googleapis.com/v0/b/hope-57790.appspot.com/o/Users%2FImages%2FProfile%2F27%20O%20YYYY%2C12%3A40%20AM?alt=media&token=eaa512d5-d3ec-4b07-8306-21301e042f15";

class ProfileModifySceen extends StatelessWidget {
  const ProfileModifySceen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    final changeNameController = Get.put(ChangeNameController());
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: userController.getUser.profilePhoto.isEmpty
                              ? Image.asset("assets/categorie_images/shoe1.png",
                                  height: 80, width: 80)
                              : Image.network(
                                  userController.userModel.value.profilePhoto,
                                  height: 85,
                                  width: 85,
                                  fit: BoxFit.cover)),
                      TextButton(
                          onPressed: () {
                            userController.userProfile();
                          },
                          child: Text("Change Profile"))
                    ],
                  )),
              SizedBox(height: 4),
              Divider(),
              SizedBox(height: 4),
              Text("Information Profile",
                  style: Theme.of(context).textTheme.titleMedium),
              MyMenuProfile(
                  title: "Name",
                  value: userController.getUser.firstName,
                  onPressed: () => Get.to(ChangeNameScreen())),
              MyMenuProfile(title: "Prenom", value: "Bob", onPressed: () {}),
              Divider(),
              Text("Information Personnelle",
                  style: Theme.of(context).textTheme.titleMedium),
              MyMenuProfile(
                  title: "User ID", value: "455dlld", onPressed: () {}),
              MyMenuProfile(
                  title: "Email",
                  value: userController.getUser.email,
                  onPressed: () {}),
              MyMenuProfile(
                  title: "Numero",
                  value: userController.getUser.phoneNumber,
                  onPressed: () {}),
              MyMenuProfile(title: "Gender", value: "male", onPressed: () {}),
              MyMenuProfile(
                  title: "Date de Naissance",
                  value: "25 Juin 1995",
                  onPressed: () {}),
              SizedBox(height: 24),
              Divider(),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Delet(context);
                      },
                      child: Text('Close Account')))
            ],
          ),
        ),
      ),
    );
  }
}

void Delet(BuildContext context) {
  final changeNameController = Get.put(ChangeNameController());
  Get.defaultDialog(
      title: "Suppression du Compte",
      textCancel: "Annuler",
      textConfirm: "Continuer",
      onConfirm: () => changeNameController.deleUserAccount(),
      onCancel: () => Navigator.pop(context),
      content: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        child: Text("voulez vous dèdefinivement supprimer votre compt?"),
      ));
}
