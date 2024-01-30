import 'dart:convert';
import './user_data_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class WeatherInformation {
  final String location;
  final String temperature;
  final String condition;
  final String maxTemperature;
  final String minTemperature;
  final String feelsLike;
  final String windSpeed;
  final String humidity;
  final String uvIndex;
  final String visibility;
  final String airPressure;
  final String sunRise;
  final String sunSet;

  WeatherInformation(
      {required this.location,
      required this.temperature,
      required this.condition,
      required this.feelsLike,
      required this.windSpeed,
      required this.humidity,
      required this.uvIndex,
      required this.visibility,
      required this.airPressure,
      required this.sunRise,
      required this.sunSet,
      required this.maxTemperature,
      required this.minTemperature});
}

class WeatherController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    updateWeatherInformation();

  }

  String currentPlace = "";
  Rx<WeatherInformation> currentWeatherInformation = WeatherInformation(location: "...", temperature: "...", condition: "...", feelsLike: "...", windSpeed: "...", humidity: "...", uvIndex: "...", visibility: "...", airPressure: "...", sunRise: "...", sunSet: "...", maxTemperature: "...", minTemperature: "...").obs;

  Future<WeatherInformation?> fetchWeatherInformation() async {
    var a = await http.get(Uri.parse("https://wttr.in/${(currentPlace.split(" ").join("+"))}?format=j1"));
    print(jsonDecode(a.body)["nearest_area"]);
    print(jsonDecode(a.body)["current_condition"]);
    if (a.statusCode == 200) {
      var output = jsonDecode(a.body);
      return WeatherInformation(location: output["nearest_area"][0]["areaName"][0]["value"], 
        temperature: output["current_condition"][0]["temp_C"], 
        condition: output["current_condition"][0]["weatherDesc"][0]["value"], 
        feelsLike: output["current_condition"][0]["FeelsLikeC"], 
        windSpeed: output["current_condition"][0]["windspeedKmph"],
        humidity: output["current_condition"][0]["humidity"],
        uvIndex: output["current_condition"][0]["uvIndex"],
        visibility: output["current_condition"][0]["visibility"],
        airPressure: output["current_condition"][0]["pressure"],
        sunRise: output["weather"][0]["astronomy"][0]["sunrise"],
        sunSet: output["weather"][0]["astronomy"][0]["sunset"],
        maxTemperature: output["weather"][0]["maxtempC"],
        minTemperature: output["weather"][0]["mintempC"]);
    }
    else {
      return null;
    }

  }

  Future<void> updateWeatherInformation() async {
    var weather = await fetchWeatherInformation();
    if (weather != null) {
      currentWeatherInformation.value = weather;
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    Get.offNamed("/");
  }
}

class WeatherBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(WeatherController());
    Get.put(UserDataController());
  }
  
}
