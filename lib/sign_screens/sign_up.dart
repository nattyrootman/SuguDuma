// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/sign_screens/sign_in.dart';
import 'package:hope/utiles/colors.dart';

import '../utiles/mytext_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          //decoration: BoxDecoration(gradient: MyColor.line1),
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
              Text("SuguDouma",
                  style: Theme.of(context).textTheme.headlineMedium),
              MyTextField(text: "Name", suffix: Icon(Icons.person)),
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
                child: Center(child: Text("Enregister")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already member?"),
                  TextButton(
                      onPressed: () {
                        Get.to(SignInScreen());
                      },
                      child: Text("Sign in",
                          style:
                              TextStyle(color: Theme.of(context).hintColor))),
                ],
              ),
              Text("Or"),
              Divider(),
              Mycontainer(
                height: 40,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(8.0),
                radius: 10,
                //color: Colors.grey.shade200,
                gradient: MyColor.line3,
                child: Row(
                  children: [
                    Image.asset(
                      "assets/google.png",
                    ),
                    SizedBox(width: 35),
                    Text("Sign up with Google"),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Mycontainer(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(8.0),
                  radius: 10,
                  //color: Colors.grey.shade200,
                  gradient: MyColor.line3,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/facebook2.png",
                      ),
                      SizedBox(width: 35),
                      Text(" Sign up with Facebook"),
                    ],
                  )
                  //
                  )
            ],
          ),
        ),
      ),
    );
  }
}


/* Image.asset(
                  "assets/facebook.png",
                  // height: 35,
                ),*/