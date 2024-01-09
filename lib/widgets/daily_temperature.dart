import 'package:flutter/material.dart';
import 'package:Wawsim/util.dart';

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
    var width = MediaQuery.sizeOf(context).width;
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: height / 40,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: width / 4.5,
            child: Text(day,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white, fontSize: devicePixelRatio * 5.5)),
          ),
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: width / 4,
            child: Text(
              weather,
              style: TextStyle(
                  color: Colors.white, fontSize: devicePixelRatio * 5.5),
            ),
          ),
          Text(
            temperature,
            overflow: TextOverflow.ellipsis,
            style:
                TextStyle(color: Colors.white, fontSize: devicePixelRatio * 6),
          ),
        ],
      ),
    ]);
  }
}
