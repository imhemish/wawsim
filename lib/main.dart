import 'package:flutter/material.dart';
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
      routes: {
        "/login": (context) => LoginPage(),
        "/weather": (context) => WeatherPage(),
        "/": ((context) => OnboardingPage())
      },
      initialRoute: "/",
    );
  }
}
