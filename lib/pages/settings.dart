import '../controllers/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _textController = TextEditingController();
  var userDataController = Get.find<UserDataController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Obx(
        () => Column(
          children: <Widget>[
            SizedBox(height: 10,),
            Text("Places", style: Theme.of(context).textTheme.headlineMedium,),
            SizedBox(height: 10,),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  
                  SizedBox(width: 340, child: TextField(controller: _textController, decoration: InputDecoration(labelText: "Add Place"),)),
                  IconButton(onPressed: () {
                    userDataController.addPlace(_textController.text.trim());
                  }, 
                  icon: const Icon(Icons.add)
                  )
                ],
              ),
          ]+
          userDataController.places.map((place) => ConstrainedBox(
            constraints: BoxConstraints.loose(const Size(550, double.infinity)),
            child: ListTile(title: Text(place), trailing: 
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red,), onPressed: () => userDataController.deletePlace(place),)
              ,),
          )).toList()+
          [
            ConstrainedBox(constraints:BoxConstraints.loose(Size(550, double.infinity)), child: Divider()),
            SizedBox(height: 10,),
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size(550, double.infinity)),
              child: ListTile(trailing: IconButton(icon: Icon(Icons.add_a_photo_outlined, color: Colors.blue,), onPressed: () => userDataController.uploadImage(),), title: Text("Background Image")),
            ),
          ]
          ,
        ),
      ),
    );
  }
}