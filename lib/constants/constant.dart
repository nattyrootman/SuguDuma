import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hope/models/user.dart';
import 'package:hope/screens/home_screen/home_screen.dart';

final themeController = Get.put(ThemeController());

List<HorizontalItem> horizontalItem = [
  HorizontalItem(image: "assets/categorie_images/shoe1.png", name: "Shoe"),
  HorizontalItem(image: "assets/categorie_images/cloth2.png", name: "Cloth"),
  HorizontalItem(
      image: "assets/categorie_images/elec1.png", name: "Electronic"),
  HorizontalItem(image: "assets/categorie_images/sport1.png", name: "Shoe"),
  HorizontalItem(
      image: "assets/categorie_images/menage2.png", name: "ElectoMenager"),
  HorizontalItem(image: "assets/categorie_images/meub2.png", name: "Meuble")
];
