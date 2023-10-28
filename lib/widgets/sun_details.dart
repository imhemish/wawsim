import 'package:flutter/material.dart';
import './darker_container.dart';

class SunDetails extends StatelessWidget {
  const SunDetails(this.sunset, this.sunrise);
  final String sunset;
  final String sunrise;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return CustomDarkerContainer(
        height / 4,
        null,
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage("assets/moonrise.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.transparent.withAlpha(100), BlendMode.dstATop))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 18, vertical: height / 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.sunny_snowing,
                          color: Colors.white,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "Sunset\n",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 174, 184, 210))),
                            TextSpan(
                                text: sunset,
                                style: TextStyle(color: Colors.white))
                          ]),
                          textAlign: TextAlign.center,
                        )
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.sunny,
                          color: Colors.white,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "Sunrise\n",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 174, 184, 210))),
                            TextSpan(
                                text: sunrise,
                                style: TextStyle(color: Colors.white))
                          ]),
                          textAlign: TextAlign.center,
                        )
                      ]),
                ],
              ),
            )));
  }
}
