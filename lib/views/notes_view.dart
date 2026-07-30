import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';
import 'dart:ui';



class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotesViewBody(),

      floatingActionButton: ClipRRect(
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
                  Colors.white.withAlpha(70),
                  Colors.white.withAlpha(40),
                  Colors.white.withAlpha(20),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              border: Border(
                top: BorderSide(color: Colors.grey.withAlpha(180), width: 0.9),
              ),
            ),
            child: Center(
              child: IconButton(
                padding: EdgeInsets.all(0),

                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    enableDrag: true,
                    // showDragHandle: true,
                    // backgroundColor: const Color.fromARGB(255, 19, 18, 18),
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
                icon: Icon(
                  Icons.edit_note_rounded,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}
// class NotesView extends StatelessWidget {
//   const NotesView({super.key}) ;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//               isScrollControlled: true,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               context: context,
//               builder: (context) {
//                 return const AddNoteBottomSheet();
//               });
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: const NotesViewBody(),
//     );
//   }
// }
