import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/floating_button.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),
      floatingActionButton: FloatingButton(),
    );
  }
}
