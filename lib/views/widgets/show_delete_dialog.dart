import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

dynamic showDeleteMessage(BuildContext context, NoteModel note) {
  final double buttonPadding = MediaQuery.of(context).size.width * 0.069;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: kBackGroundColor,
        contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: Colors.white.withAlpha(80), width: 0.8),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(9),
              decoration: BoxDecoration(
                // color: Colors.pink.withAlpha(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.pink.withAlpha(100),
                    Colors.pink.withAlpha(70),
                    Colors.pink.withAlpha(40),
                  ],
                  begin: AlignmentGeometry.topCenter,
                  end: AlignmentGeometry.bottomCenter,
                ),
                shape: BoxShape.circle,
                border: Border(top: BorderSide(color: Colors.pink, width: 1.2)),
              ),
              child: Icon(Icons.delete, color: Colors.white, size: 36),
            ),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to remove this note? ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: buttonPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha(6),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: Colors.grey.withAlpha(100),
                        width: 0.6,
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 13,
                        // color: kPrimaryColor,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    note.delete();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: buttonPadding,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: 13,
                        // color: Colors.pink,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      );
    },
  );
}
