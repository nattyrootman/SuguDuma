import 'package:get/get.dart';
import 'package:hope/themes/mytheme.dart';

class ThemeController extends GetxController {
  Rx<bool> isDark = true.obs;

  getTheme() {
    return isDark.value ? MythemeData.darkThemData : MythemeData.ligthThem;
  }
}
