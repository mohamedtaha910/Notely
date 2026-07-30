import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  height: 24,
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
                note.date,
                style: TextStyle(color: Colors.black54, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic showDeleteMessage(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.pink.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delete, color: Colors.pink, size: 36),
              ),
              SizedBox(height: 16),
              Text(
                'Are you sure you want to remove this note? ',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 18,
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
                  SizedBox(width: 12),
                  GestureDetector(
                    onTap: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 18,
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
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ==========================================
// class NoteItem extends StatelessWidget {
//   const NoteItem({super.key, required this.note});

//   final NoteModel note;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) {
//             return EditNoteView(
//               note: note,
//             );
//           }),
//         );
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(note.color),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             ListTile(
//               title: Text(
//                 note.title,
//                 style: const TextStyle(
//                   fontSize: 26,
//                   color: Colors.black,
//                 ),
//               ),
//               subtitle: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 child: Text(
//                   note.subTitle,
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.black.withOpacity(.4),
//                   ),
//                 ),
//               ),
//               trailing: IconButton(
//                 onPressed: () {
//                   note.delete();

//                   BlocProvider.of<NotesCubit>(context).fetchAllNotes();
//                 },
//                 icon: const Icon(
//                   Icons.delete,
//                   color: Colors.black,
//                   size: 30,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Text(
//                 note.date,
//                 style: TextStyle(
//                   color: Colors.black.withOpacity(.4),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
