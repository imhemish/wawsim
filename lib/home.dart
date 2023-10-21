import 'package:flutter/material.dart';
import './widgets/individual_weather_detail.dart';
import './widgets/daily_temperature.dart';
import './widgets/darker_container.dart';
import './widgets/container_temperature.dart';
import './widgets/air_quality.dart';
import './util.dart';

class MyHomePage extends StatelessWidget {
  final bool flex = false;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = getAdjustedPixelRatio(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.read_more,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            ],
            title: Title(
              color: Colors.blue,
              child: Text(flex ? "Mullana" : ""),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mullana",
                  style: TextStyle(
                      color: Colors.white, fontSize: devicePixelRatio * 12),
                ),
                SizedBox(
                  height: height / 9,
                ),
                Text.rich(
                    TextSpan(style: TextStyle(color: Colors.white), children: [
                  TextSpan(
                      text: "25°",
                      style: TextStyle(fontSize: devicePixelRatio * 30)),
                  TextSpan(
                      text: "Sunny",
                      style: TextStyle(fontSize: devicePixelRatio * 8))
                ])),
                SizedBox(
                  height: height / 200,
                ),
                Text(
                  "Wed 31°/18° Air Quality:83 - Satisfactory",
                  style: TextStyle(
                      color: Colors.white, fontSize: devicePixelRatio * 5.5),
                ),
                SizedBox(
                  height: height / 20,
                ),
                CustomDarkerContainer(
                  height / 6,
                  null,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width / 6000),
                    child: Row(
                      children: const [
                        CustomContainerTemperature("Now", "25"),
                        CustomContainerTemperature("8:00 PM", "24"),
                        CustomContainerTemperature("9:00 PM", "23"),
                        CustomContainerTemperature("10:00 PM", "23"),
                        CustomContainerTemperature("11:00 PM", "22"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 45,
                ),
                CustomDarkerContainer(
                    null,
                    null,
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height / 45,
                          ),
                          Text(
                            "Tomorrow's temperature",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: devicePixelRatio * 7),
                          ),
                          SizedBox(
                            height: height / 150,
                          ),
                          Text(
                            "Expect the same as today",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: devicePixelRatio * 5),
                          ),
                          SizedBox(
                            height: height / 20,
                          ),
                          Icon(
                            Icons.circle,
                            size: 7,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          SizedBox(
                            height: height / 50,
                          ),
                        ],
                      ),
                    )),
                SizedBox(
                  height: height / 45,
                ),
                CustomDarkerContainer(
                    null,
                    null,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomDailyContainer(
                            "Today", Icons.sunny, "Sunny", "31°/18°"),
                        CustomDailyContainer(
                            "Tomorrow", Icons.sunny, "Sunny", "32°/19°"),
                        CustomDailyContainer(
                            "Fri", Icons.sunny, "Sunny", "32°/20°"),
                        CustomDailyContainer(
                            "Sat", Icons.sunny, "Mostly sunny", "33°/20°"),
                        CustomDailyContainer(
                            "Sun", Icons.sunny, "Mostly sunny", "33°/20°"),
                        CustomDailyContainer(
                            "Mon", Icons.sunny, "Saturated sh...", "27°/19°"),
                        CustomDailyContainer(
                            "Tue", Icons.sunny, "Saturated sh...", "25°/18°"),
                        SizedBox(height: height / 70),
                        Divider(
                          color: Color(0xFF090542),
                          indent: width / 18,
                          endIndent: width / 18,
                          thickness: height / 250,
                        ),
                        SizedBox(height: height / 70),
                        Text("15-day weather forecast",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: devicePixelRatio * 6)),
                        SizedBox(height: height / 40),
                      ],
                    )),
                SizedBox(
                  height: height / 45,
                ),
                CustomDarkerContainer(null, null, AirQuality()),
                SizedBox(
                  height: height / 45,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        IndividualWeatherDetail(
                            Icons.thermostat, "Feels like", "25°"),
                        SizedBox(
                          height: height / 60,
                        ),
                        IndividualWeatherDetail(
                            Icons.water_drop, "Humidity", "57%"),
                        SizedBox(
                          height: height / 60,
                        ),
                        IndividualWeatherDetail(
                            Icons.remove_red_eye_rounded, "Visibility", "10mi")
                      ]),
                      Column(children: [
                        IndividualWeatherDetail(
                            Icons.air, "WNW Wind", "8 Km/h"),
                        SizedBox(
                          height: height / 60,
                        ),
                        IndividualWeatherDetail(
                            Icons.sunny, "UV", "0 Very Weak"),
                        SizedBox(
                          height: height / 60,
                        ),
                        IndividualWeatherDetail(
                            Icons.arrow_downward, "Air Pressure", "1009 hPa")
                      ]),
                    ]),
              ],
            ),
          ))),
    );
  }
}
