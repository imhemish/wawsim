import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();

  void login () async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("user", usernameController.text);
  }
}