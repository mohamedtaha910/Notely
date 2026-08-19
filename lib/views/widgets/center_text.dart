import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            // color: Colors.white70.withAlpha(25),
            // borderRadius: BorderRadius.circular(100),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(70),
                Colors.white.withAlpha(40),
                Colors.white.withAlpha(20),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border(
              top: BorderSide(color: Colors.grey.withAlpha(150), width: 1.4),
            ),
          ),
          child: text == 'Search your Notes.'
              ? Image.asset(
                  'assets/icons/search.png',
                  height: 80,
                )
              : Image.asset(
                  'assets/icons/no-document.png',
                  height: 80,
                ),
        ),
        SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white54, fontSize: 16),
          ),
        )
      ],
    );
  }
}
