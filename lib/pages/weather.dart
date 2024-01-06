import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uitask/widgets/lifestyle_tip_individual.dart';
import '../widgets/individual_weather_detail.dart';
import '../widgets/daily_temperature.dart';
import '../widgets/darker_container.dart';
import '../widgets/container_temperature.dart';
import '../widgets/air_quality.dart';
import '../widgets/sun_details.dart';
import '../util.dart';
import '../controllers/weather_controller.dart';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final controller = Get.find<WeatherController>();
  bool _stretched = true;

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
          backgroundColor: Colors.transparent,
          body: CustomScrollView(slivers: [
            SliverAppBar(
              stretch: _stretch,
              stretchTriggerOffset: 1,
              onStretchTrigger: () async => {setState(() {_stretched = true;})},
              backgroundColor: _stretched ? Colors.transparent : Colors.black, 
              pinned: true,
              expandedHeight: height / 3,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(
                    horizontal: width / 18, vertical: height / 60),
                title: Obx(
                  () => Text(
                    controller.currentWeatherInformation.value.location,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: controller.logOut,
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
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(
                              text: "25°",
                              style:
                                  TextStyle(fontSize: devicePixelRatio * 30)),
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
                          color: Colors.white,
                          fontSize: devicePixelRatio * 5.5),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                   
                    Obx(
                      () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              IndividualWeatherDetail(
                                  Icons.thermostat, "Feels like", "${controller.currentWeatherInformation.value.feelsLike}°"),
                              SizedBox(
                                height: height / 60,
                              ),
                              IndividualWeatherDetail(
                                  Icons.water_drop, "Humidity", "${controller.currentWeatherInformation.value.humidity}%"),
                              SizedBox(
                                height: height / 60,
                              ),
                              IndividualWeatherDetail(
                                  Icons.remove_red_eye_rounded,
                                  "Visibility",
                                  "${controller.currentWeatherInformation.value.visibility}mi")
                            ]),
                            Column(children: [
                              IndividualWeatherDetail(
                                  Icons.air, "WNW Wind", "${controller.currentWeatherInformation.value.windSpeed} Km/h"),
                              SizedBox(
                                height: height / 60,
                              ),
                              IndividualWeatherDetail(
                                  Icons.sunny, "UV", controller.currentWeatherInformation.value.uvIndex),
                              SizedBox(
                                height: height / 60,
                              ),
                              IndividualWeatherDetail(Icons.arrow_downward,
                                  "Air Pressure", "${controller.currentWeatherInformation.value.airPressure} hPa")
                            ]),
                          ]),
                    ),
                    SizedBox(
                      height: height / 45,
                    ),
                    Obx(() => SunDetails(controller.currentWeatherInformation.value.sunSet, controller.currentWeatherInformation.value.sunRise)),
                    SizedBox(
                      height: height / 20,
                    ),
                    CustomDarkerContainer(
                      null,
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
                            CustomDailyContainer("Mon", Icons.sunny,
                                "Saturated showers", "27°/19°"),
                            CustomDailyContainer("Tue", Icons.sunny,
                                "Saturated showers", "25°/18°"),
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
                    
                    
                    
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 30),
                      child: Text(
                        "Lifestyle Tips",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: devicePixelRatio * 5),
                      ),
                    ),
                    SizedBox(
                      height: height / 60,
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            LifeStyleTipIndividual(Icons.sports_gymnastics,
                                "Suitable for outdoor workouts"),
                            SizedBox(
                              height: height / 60,
                            ),
                            LifeStyleTipIndividual(Icons.add_circle_outline,
                                "Use oil-controlled products"),
                            SizedBox(
                              height: height / 60,
                            ),
                            LifeStyleTipIndividual(Icons.energy_savings_leaf,
                                "Very suitable for a trip"),
                            SizedBox(
                              height: height / 60,
                            ),
                            LifeStyleTipIndividual(
                                Icons.traffic, "Good traffic conditions"),
                          ],
                        ),
                        Column(
                          children: [
                            LifeStyleTipIndividual(Icons.local_car_wash,
                                "Suitable for car washing"),
                            SizedBox(
                              height: height / 60,
                            ),
                            LifeStyleTipIndividual(
                                Icons.wb_sunny, "Moderate UV index"),
                            SizedBox(
                              height: height / 60,
                            ),
                            LifeStyleTipIndividual(
                                Icons.expand_more, "Very low pollen count"),
                            SizedBox(
                              height: height / 60,
                            ),
                            LifeStyleTipIndividual(
                                Icons.shield, "Some mosquitoes"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]))
          ])),
    );
  }
}
