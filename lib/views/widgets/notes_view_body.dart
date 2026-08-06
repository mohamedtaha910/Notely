import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';

// class NotesViewBody extends StatefulWidget {
//   const NotesViewBody({super.key});

//   @override
//   State<NotesViewBody> createState() => _NotesViewBodyState();
// }

// class _NotesViewBodyState extends State<NotesViewBody> {

//   @override
//   void initState() {
//    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24),
//       child: Column(
//         children: const [
//           SizedBox(
//             height: 50,
//           ),
//           CustomAppBar(
//             title: 'Notes',
//             icon: Icons.search,
//           ),
//           Expanded(
//             child: NotesListView(),
//           ),
//         ],
//       ),
//     );
//   }
// }
class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: SafeArea(
        top: false,
        child: Stack(
        
          children: [
            
            NotesListView(),
            Positioned(
  top: 0,
  right: 0,
  left: 0,
  child: IgnorePointer(
    child: Container(
      height: 125,
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
              top: 0,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(top :36.0),
                child: CustomAppBar(title: 'Notes', icon: CupertinoIcons.search),
              )),
            // NoteItem()
          ],
        ),
      ),
    );
  }
}
