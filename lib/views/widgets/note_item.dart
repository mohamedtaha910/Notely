import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditNoteView(note: note)),
        );
      },
      onLongPress: () {
        showNotedialog(context, note);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        // padd
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              title: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                note.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  // fontWeight: FontWeight.w700,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 0),
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  note.subTitle,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  showDeleteMessage(context);
                },
                child: Image.asset(
                  'assets/icons/trash.png',
                  height: 22,
                  // color: Colors.black,
                ),

                // child: Container(
                //   padding: EdgeInsets.all(4),
                //   // margin: EdgeInsets.only(right: 8),
                //   decoration: BoxDecoration(
                //     // color: Colors.pink.shade700,
                //     color: Colors.black,
                //     shape: BoxShape.circle,
                //     border: Border.all(color: Colors.white54, width: 0.9),
                //   ),
                //   child: Image.asset(
                //     'assets/images/trash.png',
                //     height: 24,
                //     // color: Colors.black,
                //   ),
                // ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Text(
                DateFormat(
                  'MMMM d, yyyy',
                ).format(DateTime.parse(note.date)),
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic showDeleteMessage(BuildContext context) {
    final double buttonPadding = MediaQuery.of(context).size.width * 0.069;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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
                        end: AlignmentGeometry.bottomCenter),
                    shape: BoxShape.circle,
                    border: Border(
                        top: BorderSide(color: Colors.pink, width: 1.2))),
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

  dynamic showNotedialog(BuildContext context, NoteModel note) {
    final NoteModel noteModel = note;
    final Color color = Color(noteModel.color);
    return showDialog(
      context: context,
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: AlertDialog(
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            // color: Colors.white10,
                            gradient: LinearGradient(
                              colors: [
                                // Colors.blue.withAlpha(200),
                                // Colors.blue.withAlpha(150),
                                // Colors.blue.withAlpha(120),

                                kPrimaryColor.withAlpha(200),
                                kPrimaryColor.withAlpha(150),
                              ],
                              begin: AlignmentGeometry.topCenter,
                              end: AlignmentGeometry.bottomCenter,
                            ),
                            // border: Border(
                            //   top: BorderSide(
                            //     color: Colors.white.withAlpha(200),
                            //     width: 5.8,
                            //   ),
                            // ),

                            border: Border.all(
                              color: Colors.white.withAlpha(100),
                              width: 2,
                            )),
                        child: Image.asset(
                          'assets/icons/sticky-note.png',
                          height: 45,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    noteModel.title,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18),
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
}
