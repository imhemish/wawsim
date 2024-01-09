import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

class LoginController extends GetxController {

  Future<void> loginWithEmailPassword (String email, String password) async {
    User? user;
    try {
      user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
    } on FirebaseAuthException catch(e){
      print(e);
      late String reason;
      switch (e.code) {
        case 'invalid-email':
          reason = "The email provides is invalid";
          break;
        case "user-disabled":
          reason = "The user is not allowed";
          break;
        case "user-not-found":
          reason = "Wrong email";
          break;
        case "wrong-password":
          reason = "Wrong password provided";
        default:
          reason = e.code;
          break;
      }
      Get.snackbar("Login Failed", reason);
    }
    if (user != null) {
      Get.offNamed("/weather");
    } else {
      Get.snackbar("Login Failed", "Unknown reason");
    }
  }

  Future<UserCredential?> loginWithGoogleOnWeb() async {
    UserCredential? credential;
    try {
    credential = await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      print(e);
    }
    return credential;
  }

  Future<UserCredential?> loginWithGoogleOnMobile() async {
    UserCredential? credential;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final googleCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      credential = await FirebaseAuth.instance.signInWithCredential(googleCredential);
    } catch(e) {
      print("Auth failed");
      Get.snackbar("Login Failed", e.toString());
    }
    return credential;

  }

  Future<void> loginWithGoogle() async {
    UserCredential? credential;
    if (kIsWeb) {
      credential = await loginWithGoogleOnWeb();
    } else if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      credential = await loginWithGoogleOnMobile();
    } else {
      Get.snackbar("Login Failed", "Platform not supported");
      return;
    }
    
    if (credential?.user == null) {
      print("auth failed");
    } else {
      Get.offAllNamed("/weather");
      print("success");
    }
  }

  Future<UserCredential?> loginWithGithubOnWeb() async {
    UserCredential? credential;
    try {
    credential = await FirebaseAuth.instance.signInWithPopup(GithubAuthProvider());
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      print(e);
    }
    return credential;
    
  }

  Future<UserCredential?> loginWithGithubOnMobile() async {
    UserCredential? credential;
    try {
    credential = await FirebaseAuth.instance.signInWithProvider(GithubAuthProvider());
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      print(e);
    }
    return credential;
  }

  Future<void> loginWithGithub() async {
    UserCredential? credential;
    if (kIsWeb) {
      credential = await loginWithGithubOnWeb();
    } else if (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS) {
      credential = await loginWithGithubOnMobile();
    } else {
      Get.snackbar("Login Failed", "Platform not supported");
      return;
    }
    if (credential?.user == null) {
      print("auth failed");
    } else {
      Get.offAllNamed("/weather");
      print("success");
    }
  }
}