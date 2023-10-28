import 'package:flutter/material.dart';
import './darker_container.dart';
import '../util.dart';

class IndividualWeatherDetail extends StatelessWidget {
  const IndividualWeatherDetail(this.icon, this.parameter, this.value);
  final IconData icon;
  final String parameter;
  final String value;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = getAdjustedPixelRatio(context);
    return CustomDarkerContainer(
        null,
        width / 2.35,
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 30, vertical: height / 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: height / 80,
              ),
              Text(
                parameter,
                style: TextStyle(
                    color: Color.fromARGB(255, 179, 169, 236),
                    fontSize: devicePixelRatio * 6),
              ),
              SizedBox(
                height: height / 80,
              ),
              Text(
                value,
                style: TextStyle(
                    color: Color(0xfffeffff), fontSize: devicePixelRatio * 6),
              )
            ],
          ),
        ));
  }
}
