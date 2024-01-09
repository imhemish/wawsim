import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var loginController = Get.put(LoginController());
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
              Text("Let's Login", style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
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
                  onPressed: () => {
                    loginController.loginWithEmailPassword(_usernameController.text, _passwordController.text)},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text("Login", style: TextStyle(color: Colors.white),),
                ),
                SizedBox(
                  height: size.height/20,
                ),
                SizedBox(
                  height: size.height/40,
                ),
                Text("or Sign In with"),
                SizedBox(
                  height: size.height/40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                  ElevatedButton(child: Image.asset("assets/google.png", width: 35,), onPressed: () => loginController.loginWithGoogle(), ),
                  SizedBox(width: 10,),
                  ElevatedButton(child: Image.asset("assets/github.png", width: 35,), onPressed: () => loginController.loginWithGithub(),)
                  ]
                ),
                
                Expanded(child: Align(alignment: Alignment.bottomCenter, child: TextButton(onPressed: () {Get.offNamed("/signup");}, child: Text("Don't have an account?",)))),
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