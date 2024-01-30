import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../controllers/onboard_controller.dart';

class OnboardingPage extends StatefulWidget {

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> with TickerProviderStateMixin {

  var controller = Get.find<OnboardController>();
  late AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller.checkLoggedIn();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )
      ..forward()
      ..repeat(reverse: true);
    
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
                    'Welcome to Wawsim',
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

                  AnimatedBuilder(animation: animationController, builder: (context, child) {
                    return SizedBox(
                      height: 200,
                      child: Padding(
                          padding: EdgeInsets.all(35 * animationController.value),
                          child: child,
                        ),
                    );
                    },

                    child: Image.asset(
                          'assets/icon.png', // Replace with your weather icon asset
                          height: 150,
                          width: 150,
                        )
                  ),
                  
                  ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {
                          Get.offNamed("/login");
                        },
                        child: Text('Get Started', style: Theme.of(context).textTheme.titleMedium,),
                      ),
                  
                ],
              ),
            ),
          
        
      ),
    );
  }
}
