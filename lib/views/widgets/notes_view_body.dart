// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/search_page.dart';
import 'package:notes_app/views/widgets/custom_shadow.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'notes_list_view.dart';
import 'package:iconsax/iconsax.dart';

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
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Stack(
        children: [
          NotesListView(),
          CustomShadow(),
          Positioned(
              top: 36,
              right: 0,
              left: 0,
              child: CustomAppBar(
                title: 'Notely',
                icon: Iconsax.search_normal,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => SearchPage())));
                },
              )),
          // NoteItem()
        ],
      ),
    );
  }
}
