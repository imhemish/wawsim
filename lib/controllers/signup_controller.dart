import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpController extends GetxController {
  Future<void> signup(String email, String password) async {
     User? user;
     try {
     user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
     } on FirebaseAuthException catch(e) {
      late String reason;
      switch(e.code) {
        case 'email-already-in-use':
          reason = "This email is already in use";
          break;
        case 'invalid-email':
          reason = "The email provided is invalid";
          break;
        case 'weak-password':
          reason = "Please make a strong password";
          break;
        default:
          reason = e.code;
          break;
      }
      Get.snackbar("Sign Up failed", reason);
     }
     if (user == null) {
      Get.snackbar("Sign Up failed", "Unknown reason");
      print("ah failed auth");
     } else {
      print("successful auth");
      
     }


    
  }
}