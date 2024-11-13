import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utiles/validator_form.dart';
import '../sign_controllers/reset_password_controller.dart';

class ResetPassWordScreen extends StatelessWidget {
  final String? email;
  const ResetPassWordScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        actions: const [],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Form(
          key: controller.formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "Forget Password",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(pass),
                Text(email ?? ""),
                TextFormField(
                  controller: controller.email,
                  validator: (value) => ValidatorUser.ValidedatorEmail(value),
                  decoration: InputDecoration(
                      hintText: "Email",
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () => controller.SendPassWord(),
                    child: Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

var pass =
    "No worries! Just enter your email address below, and we’ll send you a link to reset your password. Check your inbox (and spam folder) for the email!";
