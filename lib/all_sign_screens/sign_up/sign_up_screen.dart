// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/all_sign_screens/sign_controllers/sign_in_controller.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/all_sign_screens/sign_in_screens/sign_screen_in.dart';
import 'package:hope/all_sign_screens/sign_up/sign_up_form.dart';
import 'package:hope/utiles/colors.dart';

import '../sign_controllers/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final loginController = Get.put(SignInController());
    var style = Theme.of(context).cardColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          //decoration: BoxDecoration(gradient: MyColor.line1),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              Text("SuguDouma",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w700,
                      )),
              SignUpForm(),
              SizedBox(height: 20),
              InkWell(
                onTap: () => controller.SignUp(),
                child: Mycontainer(
                  height: 45,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(8.0),
                  radius: 10,
                  gradient: MyColor.line1,
                  child: Center(
                      child:
                          Text("Enregister", style: TextStyle(fontSize: 20))),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dèja inscrit?"),
                  TextButton(
                      onPressed: () {
                        Get.to(SignInScreen());
                      },
                      child: Text("Sign in",
                          style:
                              TextStyle(color: Theme.of(context).hintColor))),
                ],
              ),
              Divider(),
              Center(child: Text("Or")),
              SizedBox(height: 25),
              InkWell(
                onTap: () => loginController.LoginWithGoogle(),
                child: Mycontainer(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(8.0),
                  radius: 10,
                  //color: Colors.grey.shade200,
                  gradient: MyColor.line1,
                  child: Row(
                    children: [
                      Image.asset("assets/sign_up_images/google.png"),
                      SizedBox(width: 35),
                      Expanded(
                          child: Text("Sign up with Google",
                              style: TextStyle(color: style))),
                    ],
                  ),
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
                  gradient: MyColor.line1,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/sign_up_images/facebook2.png",
                      ),
                      SizedBox(width: 35),
                      Expanded(
                          child: Text(" Sign up with Facebook",
                              style: TextStyle(color: style))),
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
