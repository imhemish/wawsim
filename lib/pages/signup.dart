import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/signup_controller.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var signupController = Get.put(SignUpController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width/10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height/5),
              Text("Let's Sign Up", style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              SizedBox(height: size.height/20),
              ConstrainedBox(
                constraints: BoxConstraints.loose(Size(600, 70)),
                child: TextField(
                  controller: _usernameController,
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'abc@gmail.com'
                    )
                  ),
              ),
                SizedBox(
                  height: size.height/20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints.loose(Size(600, 70)),
                  child: TextField(
                    controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    )
                  ),
                ),
                SizedBox(
                  height: size.height/20,
                ),
                ElevatedButton(
                  onPressed: () => {signupController.signup(_usernameController.text, _passwordController.text)},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("SignUp", style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  height: size.height/20,
                ),
                Expanded(child: Align(alignment: Alignment.bottomCenter, child: TextButton(onPressed: () {Get.offNamed("/login");}, child: Text("Already have an account?",)))),
                SizedBox(
                  height: size.height/30,
                ),
            ],
          ),
        ),
      ),
    );
  }
}