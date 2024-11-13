// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35),
              MyLogo(),
              Text("Welcome back "),
              SizedBox(height: 35),
              Sign_In_Form(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Sougou',
      style: TextStyle(fontFamily: 'RobotoMono', fontSize: 35),
    );
  }
}
