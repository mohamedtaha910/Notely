import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomShadow extends StatelessWidget {
  const CustomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: IgnorePointer(
        child: Container(
          height: 175,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.0, 0.3, 0.5, 0.65, 0.78, 0.82, 0.88, 0.92, 1.0],
              colors: [
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(255),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(210),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(150),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(100),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(40),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(30),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(20),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(10),
                // ThemeData.dark().scaffoldBackgroundColor.withAlpha(0),
                kBackGroundColor.withAlpha(255),
                kBackGroundColor.withAlpha(190),
                kBackGroundColor.withAlpha(135),
                kBackGroundColor.withAlpha(80),
                kBackGroundColor.withAlpha(40),
                kBackGroundColor.withAlpha(30),
                kBackGroundColor.withAlpha(20),
                kBackGroundColor.withAlpha(10),
                kBackGroundColor.withAlpha(0),
                // Colors.red
              ],
            ),
          ),
        ),
      ),
    );
  }
}
