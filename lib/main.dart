import 'package:flutter/material.dart';
import 'package:uitask/controllers/onboard_controller.dart';
import 'package:uitask/controllers/weather_controller.dart';
import 'package:uitask/pages/login.dart';
import 'package:uitask/pages/onboard.dart';
import 'pages/weather.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: "/", page: () => OnboardingPage(), binding: OnboardBinding()),
        GetPage(name: "/weather", page: () => WeatherPage(), binding: WeatherBinding()),
        GetPage(name: "/login", page: () => LoginPage())
      ],
      initialRoute: "/",
    );
  }
}
