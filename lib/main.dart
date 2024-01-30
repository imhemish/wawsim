import 'package:Wawsim/pages/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:Wawsim/controllers/onboard_controller.dart';
import 'package:Wawsim/controllers/weather_controller.dart';
import 'package:Wawsim/pages/login.dart';
import 'package:Wawsim/pages/onboard.dart';
import 'package:Wawsim/pages/signup.dart';
import 'pages/weather.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:adwaita/adwaita.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
options: DefaultFirebaseOptions.currentPlatform,
);
FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Wawsim',
      debugShowCheckedModeBanner: false,
      theme: AdwaitaThemeData.light(),
      darkTheme: AdwaitaThemeData.dark(),
      getPages: [
        GetPage(name: "/", page: () => OnboardingPage(), binding: OnboardBinding()),
        GetPage(name: "/weather", page: () => WeatherPage(), binding: WeatherBinding()),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/signup", page: () => SignUpPage()),
        GetPage(name: "/settings", page: () => SettingsPage())
      ],
      initialRoute: "/",
    );
  }
}
