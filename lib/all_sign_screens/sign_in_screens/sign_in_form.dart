import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hope/all_sign_screens/sign_in_screens/reset_password_screen.dart';

import '../../common_widgets.dart/mycontainer.dart';
import '../../utiles/colors.dart';
import '../../utiles/validator_form.dart';
import '../sign_controllers/sign_in_controller.dart';
import '../sign_up/sign_up_screen.dart';

class Sign_In_Form extends StatelessWidget {
  const Sign_In_Form({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignInController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text("Connectez-vous",
                style: TextStyle(fontFamily: 'Merriweather')),
            TextFormField(
              controller: controller.email,
              validator: (value) => ValidatorUser.ValidedatorEmail(value),
              decoration: InputDecoration(
                  hintText: "Email",
                  suffixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 24),
            Obx(() => TextFormField(
                  controller: controller.passWord,
                  obscureText: controller.ishidden.value,
                  validator: (value) =>
                      ValidatorUser.ValidedatorPassWord(value),
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.ishidden.value =
                                !controller.ishidden.value;
                          },
                          icon: Icon(controller.ishidden.value
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(() => Checkbox(
                    value: controller.remember.value,
                    onChanged: (value) {
                      controller.remember.value = !controller.remember.value;
                    })),
                Text("Remember me")
              ],
            ),
            SizedBox(height: 35),
            InkWell(
              onTap: () => controller.EmailAndPasswordLogin(),
              child: Mycontainer(
                  height: 40,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.all(8.0),
                  radius: 10,
                  gradient: MyColor.line1,
                  child: Center(child: Text("Connecter"))),
            ),
            Center(
              child: TextButton(
                  onPressed: () => Get.to(ResetPassWordScreen()),
                  child: Text("Mot de passe oublié?",
                      selectionColor: Colors.blue)),
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
                        style:
                            TextStyle(color: Theme.of(context).primaryColor))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
