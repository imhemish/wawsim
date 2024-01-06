import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  Future<SharedPreferences>? prefs;

  @override
  void onInit() {
    super.onInit();
    prefs = SharedPreferences.getInstance();

  }

  Future<void> loginWithEmailPassword (String email, String password) async {
    User? user;
    try {
      user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
    } on FirebaseAuthException {
      print("auth failed");
    }
    if (user != null) {
      (await prefs)!.setString("email", user.email!);
      Get.offNamed("/weather");
    } else {
      print("ah auth failed");
    }
  }

  Future<void> loginWithGoogle() async {
  }
  
}