import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(100),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
        child: Container(
          height: 58,
          width: 58,
          decoration: BoxDecoration(
            // color: Colors.white70.withAlpha(25),
            // borderRadius: BorderRadius.circular(50),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Colors.grey.withAlpha(100),
                Colors.grey.withAlpha(70),
                Colors.grey.withAlpha(40),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border(
              top: BorderSide(color: Colors.white.withAlpha(80), width: 1),
            ),
          ),
          child: Center(
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  enableDrag: true,
                  showDragHandle: true,

                  backgroundColor: kBackGroundColor,
                  // backgroundColor: Colors.black,
                  // barrierLabel: '',
                  // barrierColor: Colors.black.withAlpha(220),
                  useSafeArea: true,
                  sheetAnimationStyle: AnimationStyle(
                    curve: Curves.easeInOutCirc,
                    duration: Duration(milliseconds: 600),
                  ),
                  context: context,
                  builder: (context) {
                    return AddNoteSheet();
                  },
                );
              },
              icon: Icon(Iconsax.edit, size: 29, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
