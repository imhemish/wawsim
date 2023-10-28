import 'package:flutter/material.dart';
import './darker_container.dart';
import '../util.dart';

class LifeStyleTipIndividual extends StatelessWidget {
  const LifeStyleTipIndividual(this.icon, this.tip);
  final IconData icon;
  final String tip;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var devicePixelRatio = getAdjustedPixelRatio(context);
    return CustomDarkerContainer(
        height / 9,
        width / 2.35,
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 30, vertical: height / 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: devicePixelRatio * 8,
                color: Colors.white,
              ),
              SizedBox(
                width: width / 40,
              ),
              Expanded(
                child: Text(
                  tip,
                  softWrap: true,
                  style: TextStyle(
                      color: Colors.white, fontSize: devicePixelRatio * 4.5),
                ),
              )
            ],
          ),
        ));
  }
}
