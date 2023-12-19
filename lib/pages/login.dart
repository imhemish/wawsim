import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
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
              Text("Let's Login", style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
              SizedBox(height: size.height/20),
              ConstrainedBox(
                constraints: BoxConstraints.loose(Size(600, 70)),
                child: TextField(
                  
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
                  onPressed: () => {Navigator.pushReplacementNamed(context, "/weather")},
                  child: const Text("Login", style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                )
            ],
          ),
        ),
      ),
    );
  }
}