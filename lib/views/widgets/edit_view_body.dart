import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/edit_text_feild.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10),
              CustomAppBar(
                onPressed: () {
                  widget.note.title = title ?? widget.note.title;
                  widget.note.subTitle = subTitle ?? widget.note.subTitle;
                  widget.note.save();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
                icon: Icons.check,
                title: 'Edit Note',
              ),
              SizedBox(height: 40),
              CustomEditTextFeild(
                onChanged: (value) {
                  title = value;
                },
                text: widget.note.title,
              ),
              SizedBox(height: 16),
              CustomEditTextFeild(
                onChanged: (value) {
                  subTitle = value;
                },
                text: widget.note.subTitle,
                height: 12,
              ),
              SizedBox(height: 32),

              EditNoteColorsList(note: widget.note),

              // Expanded(
              //   child: TextField(
              //     maxLines: null,
              //     expands: true,
              //     decoration: InputDecoration(
              //       hintText: 'Edit your note here...',
              //       border: InputBorder.none,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
