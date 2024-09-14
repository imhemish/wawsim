
import 'package:Wawsim/controllers/user_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/lifestyle_tip_individual.dart';
import '../widgets/individual_weather_detail.dart';
import '../widgets/daily_temperature.dart';
import '../widgets/darker_container.dart';
import '../widgets/container_temperature.dart';
import '../widgets/air_quality.dart';
import '../widgets/sun_details.dart';
import '../util.dart';
import '../controllers/weather_controller.dart';

ImageProvider imageStuff(BackgroundImageType type, String url) {
  if (type == BackgroundImageType.asset) {
    return const AssetImage("assets/bg.jpg");
    
  } else {
    return NetworkImage(url);
  }
}
class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final weatherController = Get.find<WeatherController>();
  final userDataController = Get.put(UserDataController(), permanent: true);
  bool _stretched = true;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = getAdjustedPixelRatio(context);
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: imageStuff(userDataController.backgroundImageType.value,userDataController.imageURL.value),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(slivers: [
                SliverAppBar(
                  stretch: _stretched,
                  stretchTriggerOffset: 5,
                  onStretchTrigger: () async => {setState(() {_stretched = true;})},
                  backgroundColor: _stretched ? Colors.transparent : Colors.black, 
                  pinned: true,
                  expandedHeight: height / 3,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.symmetric(
                        horizontal: width / 18, vertical: height / 60),
                    title: DropdownMenu(enableSearch: false, textStyle: const TextStyle(color: Colors.white), inputDecorationTheme: InputDecorationTheme(suffixIconColor: Colors.white, focusedBorder: InputBorder.none),
                      initialSelection: userDataController.places[0],
                      dropdownMenuEntries: userDataController.places.toList().map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                      onSelected: (selectedPlace) {
                        if (selectedPlace != null) {
                          weatherController.currentPlace = selectedPlace;
                          weatherController.updateWeatherInformation();
                        }
                      },
                      
                    ),
                  ),
                  actions: [
                    IconButton(
                        onPressed: weatherController.logOut,
                        icon: const Icon(
                          Icons.read_more,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () => Get.toNamed("/settings"),
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
                              style: const TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                    text: "${weatherController.currentWeatherInformation.value.temperature}°",
                                    style:
                                        TextStyle(fontSize: devicePixelRatio * 30)),
                                TextSpan(
                                    text: weatherController.currentWeatherInformation.value.condition,
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
                         
                          Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(children: [
                                    IndividualWeatherDetail(
                                        Icons.thermostat, "Feels like", "${weatherController.currentWeatherInformation.value.feelsLike}°"),
                                    SizedBox(
                                      height: height / 60,
                                    ),
                                    IndividualWeatherDetail(
                                        Icons.water_drop, "Humidity", "${weatherController.currentWeatherInformation.value.humidity}%"),
                                    SizedBox(
                                      height: height / 60,
                                    ),
                                    IndividualWeatherDetail(
                                        Icons.remove_red_eye_rounded,
                                        "Visibility",
                                        "${weatherController.currentWeatherInformation.value.visibility}mi")
                                  ]),
                                  Column(children: [
                                    IndividualWeatherDetail(
                                        Icons.air, "WNW Wind", "${weatherController.currentWeatherInformation.value.windSpeed} Km/h"),
                                    SizedBox(
                                      height: height / 60,
                                    ),
                                    IndividualWeatherDetail(
                                        Icons.sunny, "UV", weatherController.currentWeatherInformation.value.uvIndex),
                                    SizedBox(
                                      height: height / 60,
                                    ),
                                    IndividualWeatherDetail(Icons.arrow_downward,
                                        "Air Pressure", "${weatherController.currentWeatherInformation.value.airPressure} hPa")
                                  ]),
                                ],
                          ),
                          SizedBox(
                            height: height / 45,
                          ),
                          SunDetails(weatherController.currentWeatherInformation.value.sunSet, weatherController.currentWeatherInformation.value.sunRise),
                          SizedBox(
                            height: height / 20,
                          ),
                          CustomDarkerContainer(
                            null,
                            null,
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: width / 6000),
                              child: const Row(
                                children: [
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
                                  const CustomDailyContainer(
                                      "Today", Icons.sunny, "Sunny", "31°/18°"),
                                  const CustomDailyContainer(
                                      "Tomorrow", Icons.sunny, "Sunny", "32°/19°"),
                                  const CustomDailyContainer(
                                      "Fri", Icons.sunny, "Sunny", "32°/20°"),
                                  const CustomDailyContainer(
                                      "Sat", Icons.sunny, "Mostly sunny", "33°/20°"),
                                  const CustomDailyContainer(
                                      "Sun", Icons.sunny, "Mostly sunny", "33°/20°"),
                                  const CustomDailyContainer("Mon", Icons.sunny,
                                      "Saturated showers", "27°/19°"),
                                  const CustomDailyContainer("Tue", Icons.sunny,
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
                                  const LifeStyleTipIndividual(Icons.sports_gymnastics,
                                      "Suitable for outdoor workouts"),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const LifeStyleTipIndividual(Icons.add_circle_outline,
                                      "Use oil-controlled products"),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const LifeStyleTipIndividual(Icons.energy_savings_leaf,
                                      "Very suitable for a trip"),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const LifeStyleTipIndividual(
                                      Icons.traffic, "Good traffic conditions"),
                                ],
                              ),
                              Column(
                                children: [
                                  const LifeStyleTipIndividual(Icons.local_car_wash,
                                      "Suitable for car washing"),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const LifeStyleTipIndividual(
                                      Icons.wb_sunny, "Moderate UV index"),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const LifeStyleTipIndividual(
                                      Icons.expand_more, "Very low pollen count"),
                                  SizedBox(
                                    height: height / 60,
                                  ),
                                  const LifeStyleTipIndividual(
                                      Icons.shield, "Some mosquitoes"),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  
                ]))
              ])),
        ),
      
    );
  }
}
