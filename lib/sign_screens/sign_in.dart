// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/sign_screens/sign_up.dart';
import 'package:hope/utiles/colors.dart';
import 'package:hope/utiles/mytext_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  "assets/newshop7.jpg",
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 35),
            Text(
              "SuguDouma",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 50),
            MyTextField(text: "Email", suffix: Icon(Icons.email)),
            MyTextField(text: "Password", suffix: Icon(Icons.password)),
            SizedBox(height: 20),
            Mycontainer(
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              padding: EdgeInsets.all(8.0),
              radius: 10,
              gradient: MyColor.line1,
              child: Center(child: Text("Connect")),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not member?"),
                TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text("Enregister",
                        style: TextStyle(color: Theme.of(context).hintColor))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
