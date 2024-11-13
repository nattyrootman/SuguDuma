// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/utiles/validator_form.dart';

import '../sign_controllers/sign_up_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inscrivez-vous",
                style: TextStyle(
                  fontFamily: 'Merriweather',
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.firstName,
                validator: (value) => ValidatorUser.ValidedatorName(value),
                decoration: InputDecoration(
                    hintText: "First Name",
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),

              /*TextFormField(
                  controller: controller.lastName,
                  validator: (value) {
                    return value!.isEmpty ? "fille" : null;
                  },
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      suffix: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),*/
              SizedBox(height: 10),
              TextFormField(
                controller: controller.email,
                validator: (value) => ValidatorUser.ValidedatorEmail(value),
                decoration: InputDecoration(
                    hintText: "Email",
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: controller.phoneNumber,
                validator: (value) => ValidatorUser.ValidedatorNumber(value),
                decoration: InputDecoration(
                    hintText: "PhoneNumber",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              Obx(() => TextFormField(
                    validator: (value) =>
                        ValidatorUser.ValidedatorPassWord(value),
                    controller: controller.passWord,
                    obscureText: controller.isHidden.value,
                    decoration: InputDecoration(
                        hintText: "PassWord",
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.isHidden.value =
                                  !controller.isHidden.value;
                            },
                            icon: Icon(controller.isHidden.value
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )),
            ],
          )),
    );
  }
}
