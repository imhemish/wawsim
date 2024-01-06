import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
  Future<void> signup(String email, String password) async {
    var prefs = await SharedPreferences.getInstance();
     User? user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
     if (user == null) {
      print("ah failed auth");
     } else {
      prefs.setString("email", user.email!);
      print("successful auth");
      
     }


    
  }
}