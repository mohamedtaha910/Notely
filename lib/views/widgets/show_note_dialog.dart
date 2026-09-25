import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

dynamic showNotedialog(BuildContext context, NoteModel note) {
  final NoteModel noteModel = note;
  final Color color = Color(noteModel.color);
  return showDialog(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: AlertDialog(
          shadowColor: Colors.white.withAlpha(50),
          // shadowColor: color,
          scrollable: true,
          surfaceTintColor: color,
          backgroundColor: color,
          contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
            side: BorderSide(
              color: Colors.grey.shade100.withAlpha(100),
              width: 1.8,
            ),
          ),
          content: Container(
            // padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    // color: kPrimaryColor,
                    gradient: LinearGradient(
                      colors: [
                        // kPrimaryColor.withAlpha(200),
                        // kPrimaryColor.withAlpha(180),
                        // Colors.lightBlueAccent.withAlpha(20),
                        Colors.deepOrange.withAlpha(200),
                        Colors.deepOrangeAccent.withAlpha(200),
                        Colors.orange.withAlpha(200),
                      ],
                      begin: AlignmentGeometry.topCenter,
                      end: AlignmentGeometry.bottomCenter,
                    ),
                    border: Border.all(
                      color: Colors.white.withAlpha(120),
                      width: 2.2,
                    ),
                  ),
                  child: Image.asset(
                    'assets/icons/sticky-note.png',
                    height: 45,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  noteModel.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18),
                // MarkdownBody(
                //     data: noteModel.subTitle, styleSheet: markdownStyle)
                Text(
                  noteModel.subTitle,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                    height: 1.8,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
