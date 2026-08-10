import 'package:flutter/material.dart';

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
