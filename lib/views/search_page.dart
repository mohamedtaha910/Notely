import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/note_item.dart';
import 'package:svg_flutter/svg.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    String query = '';
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(top:  8.0 , bottom: 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.chevron_left_rounded, size: 36, color: Colors.white54,)),
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
        ),
        body: BlocBuilder<NotesCubit , NotesState>(
          
          builder: (context, state) {
            List<NoteModel> searchedNotes = BlocProvider.of<NotesCubit>(context).searchedNotes!;
            if(state is NotesSuccess){
              if(query == ''){
               return StartSearch(text: 'Search your Notes.' ,);
              }
              else if(searchedNotes.isEmpty ){
                return StartSearch(text: 'No Notes Found.');
              }
              else{
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal:  12.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(height: 14,),
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
              
            }
            else{
              return  StartSearch(text: 'No Notes Found');
            }
          },
           
        ),
      ),
    );
  }
}
class SearchTextFeild extends StatelessWidget {
  const SearchTextFeild({super.key,required this.onChanged});
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      // con
      autofocus: true,
      onChanged:onChanged ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 16 , vertical: 6),
        filled: true,
        fillColor: Colors.white.withAlpha(20),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  14.0),
          child: SvgPicture.asset('assets/icons/Search.svg' , height: 24, color: Colors.white38,),
        ) ,
        prefixIconConstraints: BoxConstraints(
          minHeight: 1,
          minWidth: 1,
        ),
        hint: Text(
          'Search Notes',
          style: TextStyle(
            color: Colors.white38,
            fontSize: 14,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100.withAlpha(50),
            width: 0.4,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade100.withAlpha(100),
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
class StartSearch extends StatelessWidget {
  const StartSearch({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(text , 
          style: TextStyle(
            color: Colors.white54,
            fontSize: 16
          ),
          ),
        )
      ],
    );
  }
}