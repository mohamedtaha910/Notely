import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:svg_flutter/svg.dart';

class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key, required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.white70.withAlpha(25),
            borderRadius: BorderRadius.circular(100),
            // shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.white.withAlpha(60),
                Colors.white.withAlpha(35),
                Colors.white.withAlpha(25),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border(
              top: BorderSide(color: Colors.grey.withAlpha(150), width: 1.1),
              // bottom: BorderSide(color: Colors.grey.withAlpha(100), width: 0.6),
            ),
          ),
          child: TextField(
            cursorColor: kPrimaryColor,
            // con
            autofocus: true,
            onChanged: onChanged,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              // filled: true,
              // fillColor: Colors.white.withAlpha(20),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: SvgPicture.asset(
                  'assets/icons/Search.svg',
                  height: 24,
                  color: Colors.white38,
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minHeight: 1,
                minWidth: 1,
              ),
              hint: Text(
                'Search Notes',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 14,
                ),
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none
                  // borderRadius: BorderRadius.circular(100),
                  ),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none
                  // borderRadius: BorderRadius.circular(100),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
