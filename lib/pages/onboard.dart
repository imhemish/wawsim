import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/onboard_controller.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var controller = Get.put(OnboardController());
  @override
  void initState() {
    super.initState();
    controller.checkLoggedIn();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        
            child: Align(
              alignment: Alignment.center,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Text(
                    'Welcome to Weather App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Weather details at your fingertips',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/icon.png', // Replace with your weather icon asset
                    height: 150,
                    width: 150,
                  ),
                  
                  ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: Text('Get Started'),
                      ),
                  
                  
                ],
              ),
            ),
          
        
      ),
    );
  }
}
