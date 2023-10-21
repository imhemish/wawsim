import 'package:flutter/material.dart';

class CustomDarkerContainer extends StatelessWidget {
  const CustomDarkerContainer(this.height, this.width, this.child);
  final num? height;
  final num? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height?.toDouble(),
      width: width?.toDouble(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xB3090542),
      ),
      child: child,
    );
  }
}
