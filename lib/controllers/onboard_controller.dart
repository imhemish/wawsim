import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OnboardController extends GetxController {
  Future<void> checkLoggedIn () async {
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