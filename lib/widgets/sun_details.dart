import 'package:flutter/material.dart';
import './darker_container.dart';

class SunDetails extends StatefulWidget {
  const SunDetails(this.sunset, this.sunrise);
  final String sunset;
  final String sunrise;

  @override
  State<SunDetails> createState() => _SunDetailsState();
}

class _SunDetailsState extends State<SunDetails> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  final _colorTween = ColorTween(begin: Colors.transparent.withAlpha(25), end: Colors.transparent.withAlpha(200));
  late Animation<Color?> _colorTweenAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward()..repeat(reverse: true);
    _colorTweenAnimation = _colorTween.animate(_animationController);

  }

  @override
void dispose() {
  _animationController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return CustomDarkerContainer(
        height / 4,
        null,
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage("assets/moonrise.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          _colorTweenAnimation.value!, BlendMode.dstATop))),
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
                                  text: widget.sunset,
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
                                  text: widget.sunrise,
                                  style: TextStyle(color: Colors.white))
                            ]),
                            textAlign: TextAlign.center,
                          )
                        ]),
                  ],
                ),
              )),
        ));
  }
}
