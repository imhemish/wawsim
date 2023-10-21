import 'package:flutter/material.dart';
import 'package:uitask/util.dart';

class CustomDailyContainer extends StatelessWidget {
  const CustomDailyContainer(
      this.day, this.icon, this.weather, this.temperature);
  final String day;
  final IconData icon;
  final String weather;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    var devicePixelRatio = getAdjustedPixelRatio(context);
    var height = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: height / 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(day,
              style: TextStyle(
                  color: Colors.white, fontSize: devicePixelRatio * 6)),
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            weather,
            style:
                TextStyle(color: Colors.white, fontSize: devicePixelRatio * 6),
          ),
          Text(
            temperature,
            style:
                TextStyle(color: Colors.white, fontSize: devicePixelRatio * 6),
          ),
        ],
      ),
    ]);
  }
}
