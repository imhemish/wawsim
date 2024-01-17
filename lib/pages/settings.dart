import 'package:Wawsim/controllers/places_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _textController = TextEditingController();
  var placesController = Get.find<PlacesController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: Obx(
        () => Column(
          children: <Widget>[
            
              Row(
                
                children: [
                  SizedBox(width: 300, child: TextField(controller: _textController)),
                  IconButton(onPressed: () {
                    placesController.addPlace(_textController.text.trim());
                  }, 
                  icon: Icon(Icons.done_rounded)
                  )
                ],
              ),
          ]+
          placesController.places.map((place) => ListTile(title: Text(place), trailing: 
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red,), onPressed: () => placesController.deletePlace(place),)
            ,)).toList()
          ,
        ),
      ),
    );
  }
}