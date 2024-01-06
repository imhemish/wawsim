import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnboardController extends GetxController {
  Future<void> checkLoggedIn () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!(FirebaseAuth.instance.currentUser == null)) {
      Get.offNamed("/weather");
    }
  }
}

class OnboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OnboardController());
  }
}