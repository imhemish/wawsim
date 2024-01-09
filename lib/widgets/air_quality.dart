import 'package:flutter/material.dart';
import 'package:Wawsim/util.dart';
import 'package:Wawsim/widgets/darker_container.dart';

class AirQuality extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = getAdjustedPixelRatio(context);
    return CustomDarkerContainer(
        null,
        null,
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: height / 40, horizontal: width / 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Satisfactory 83",
                style: TextStyle(
                    color: Colors.white, fontSize: devicePixelRatio * 8),
              ),
              SizedBox(
                height: height / 70,
              ),
              Text(
                "Air quality is acceptable. However, unusually sensitive people should consider reducing outdoor activity.",
                style: TextStyle(
                    color: Color.fromARGB(255, 148, 155, 196),
                    fontSize: devicePixelRatio * 4.5),
              ),
              SizedBox(
                height: height / 70,
              ),
              Container(
                height: height / 50,
                width: width / 1.2,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: const [
                  Color(0xff1f005c),
                  Color(0xff5b0060),
                  Color(0xff870160),
                  Color(0xffac255e),
                  Color(0xffca485c),
                  Color(0xffe16b5c),
                  Color(0xfff39060),
                  Color(0xffffb56b),
                ])),
                child: Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: height / 50,
                ),
              )
            ],
          ),
        ));
  }
}
