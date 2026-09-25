import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';
import 'package:notes_app/views/widgets/show_delete_dialog.dart';
import 'package:notes_app/views/widgets/show_note_dialog.dart';

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
          borderRadius: BorderRadius.circular(18),
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
              subtitle:
                  // MarkdownBody(data: note.subTitle, styleSheet: markdownStyle),
                  Padding(
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
                  showDeleteMessage(context, note);
                },
                child: Image.asset(
                  'assets/icons/trash.png',
                  height: 22,
                  // color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 0),
              child: Text(
                DateFormat('MMMM d, yyyy').format(DateTime.parse(note.date)),
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
