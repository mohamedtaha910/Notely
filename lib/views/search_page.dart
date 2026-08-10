import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/center_text.dart';
import 'package:notes_app/views/widgets/note_item.dart';
import 'package:notes_app/views/widgets/search_text_feild.dart';
import 'package:svg_flutter/svg.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  String query = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                List<NoteModel> searchedNotes =
                    BlocProvider.of<NotesCubit>(context).searchedNotes!;
                if (state is NotesSuccess) {
                  if (query == '') {
                    return CenterText(
                      text: 'Search your Notes.',
                    );
                  } else if (searchedNotes.isEmpty) {
                    return CenterText(text: 'No Notes Found.');
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 75,
                            ),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: searchedNotes.length,
                                itemBuilder: ((context, index) {
                                  NoteModel note = searchedNotes[index];
                                  return NoteItem(note: note);
                                })),
                          ],
                        ),
                      ),
                    );
                  }
                } else {
                  return CenterText(text: 'No Notes Found');
                }
              },
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: IgnorePointer(
                child: Container(
                  height: 155,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.0, 0.3, 0.5, 0.65, 0.78, 0.88, 1.0],
                      colors: [
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(240),
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(185),
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(135),
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(85),
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(40),
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(15),
                        ThemeData.dark().scaffoldBackgroundColor.withAlpha(0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 36,
              right: 12,
              left: 12,
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: 36,
                        color: Colors.white54,
                      )),
                  // Text('Search Page'),
                  Expanded(
                    child: SearchTextFeild(
                      onChanged: (value) {
                        query = value;
                        BlocProvider.of<NotesCubit>(context).searchNotes(query);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
