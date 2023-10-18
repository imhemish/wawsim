import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.transparent, actions: [
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
          ]),
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
                Container(
                  height: height / 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xB3090542),
                  ),
                  child: Row(
                    children: const [
                      CustomContainerTemperature("Now", "25"),
                      CustomContainerTemperature("8:00 PM", "24"),
                      CustomContainerTemperature("9:00 PM", "23"),
                      CustomContainerTemperature("10:00 PM", "23"),
                    ],
                  ),
                )
              ],
            ),
          ))),
    );
  }
}

class CustomContainerTemperature extends StatelessWidget {
  const CustomContainerTemperature(this.time, this.temperature);
  final String time;
  final String temperature;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height / 35,
          ),
          Text(
            time,
            style:
                TextStyle(color: Colors.white, fontSize: devicePixelRatio * 6),
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
            temperature + "°",
            style:
                TextStyle(color: Colors.white, fontSize: devicePixelRatio * 6),
          ),
        ],
      ),
    );
  }
}
