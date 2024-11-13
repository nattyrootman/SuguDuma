// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hope/common_widgets.dart/mycontainer.dart';
import 'package:hope/utiles/colors.dart';
import 'package:hope/utiles/mytext_field.dart';

class AddAdress extends StatelessWidget {
  const AddAdress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add address"),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            MyTextField(text: "Name", suffix: Icon(Icons.person)),
            MyTextField(text: "Number", suffix: Icon(Icons.person)),
            Row(
              children: [
                Expanded(
                    child: MyTextField(
                        text: "Street", suffix: Icon(Icons.streetview))),
                Expanded(
                  child: MyTextField(
                      text: "Code Postal", suffix: Icon(Icons.post_add)),
                )
              ],
            ),
            MyTextField(text: "Ville", suffix: Icon(Icons.location_city)),
            MyTextField(text: "Pays", suffix: Icon(Icons.location_city)),
            SizedBox(height: 32),
            Mycontainer(
              width: MediaQuery.of(context).size.width / 1.2,
              height: 50,
              gradient: MyColor.line1,
              child: TextButton(onPressed: () {}, child: Text("Sauver")),
            )
          ]),
        ),
      ),
    );
  }
}
