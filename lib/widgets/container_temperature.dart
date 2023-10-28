import 'package:flutter/material.dart';
import 'package:uitask/util.dart';

class CustomContainerTemperature extends StatelessWidget {
  const CustomContainerTemperature(this.time, this.temperature);
  final String time;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = getAdjustedPixelRatio(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 300),
      child: Container(
        width: width / 6.1,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 35,
            ),
            Text(
              time,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: devicePixelRatio * 4.7),
            ),
            SizedBox(
              height: height / 50,
            ),
            Image.asset(
              height: height / 60,
              "assets/moon.png",
              color: Colors.yellow,
            ),
            SizedBox(
              height: height / 60,
            ),
            Text(
              "$temperature°",
              style: TextStyle(
                  color: Colors.white, fontSize: devicePixelRatio * 4.7),
            ),
            SizedBox(
              height: height / 50,
            )
          ],
        ),
      ),
    );
  }
}
