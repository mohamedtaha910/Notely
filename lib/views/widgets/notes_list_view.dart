import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/no_notes.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        // BlocProvider.of<NotesCubit>(context).fetchAllNotes();
        List<NoteModel> notesList =
            BlocProvider.of<NotesCubit>(context).notes ?? [];
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: notesList.isEmpty ? 1 : notesList.length,
          itemBuilder: (context, index) {
            return notesList.isEmpty
                ? NoNotes()
                : Column(
                    children: [
                      index == 0
                          ? SizedBox(height: 100)
                          : const SizedBox.shrink(),
                      NoteItem(note: notesList[index]),
                      index == notesList.length - 1
                          ? SizedBox(height: 100)
                          : const SizedBox.shrink(),
                    ],
                  );
          },
        );
      },
    );
  }
}
