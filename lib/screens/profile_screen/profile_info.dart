import 'package:flutter/material.dart';
import 'package:hope/screens/profile_screen/my_menu_profile.dart';
import 'package:hope/screens/profile_screen/profile_screen.dart';

class ProfileModifaction extends StatelessWidget {
  const ProfileModifaction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
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
                          child: Image.asset(
                              "assets/categorie_images/shoe3.jpg",
                              height: 65,
                              width: 65,
                              fit: BoxFit.cover)),
                      TextButton(
                          onPressed: () {}, child: Text("Change Profile"))
                    ],
                  )),
              SizedBox(height: 4),
              Divider(),
              SizedBox(height: 4),
              Text("Information Profile",
                  style: Theme.of(context).textTheme.titleMedium),
              MyMenuProfile(
                  title: "Name", value: "bt@gmail.com", onPressed: () {}),
              MyMenuProfile(title: "Prenom", value: "Bob", onPressed: () {}),
              Divider(),
              Text("Information Personnelle",
                  style: Theme.of(context).textTheme.titleMedium),
              MyMenuProfile(
                  title: "User ID", value: "455dlld", onPressed: () {}),
              MyMenuProfile(
                  title: "Email", value: "Bth@live.com", onPressed: () {}),
              MyMenuProfile(title: "Numero", value: "637000", onPressed: () {}),
              MyMenuProfile(title: "Gender", value: "male", onPressed: () {}),
              MyMenuProfile(
                  title: "Date de Naissance",
                  value: "25 Juin 1995",
                  onPressed: () {}),
              SizedBox(height: 24),
              Divider(),
              Center(
                  child: TextButton(
                      onPressed: () {}, child: Text('Close Account')))
            ],
          ),
        ),
      ),
    );
  }
}
