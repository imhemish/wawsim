import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardController extends GetxController {
  Future<void> checkLoggedIn () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!(prefs.getString("user") == null)) {
      Get.offNamed("/weather");
    }
  }
}