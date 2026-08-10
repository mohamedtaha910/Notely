import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes=[];
  List<NoteModel>? searchedNotes=[];
  void fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    

    notes = notesBox.values.toList() ;
    // orderNotesByDate(notes!);
      notes!.isNotEmpty ? notes!.sort((a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date))) : null;

    emit(NotesSuccess());
  }
  void searchNotes(String query) {
    
    if (query.trim().isEmpty) {
      searchedNotes = [];
    } else {
      final searchQuery = query.toLowerCase().trim();

      searchedNotes = notes!.where((note) {
        return note.title.toLowerCase().contains(searchQuery) ||
            note.subTitle.toLowerCase().contains(searchQuery);
      }).toList();
    }
        emit((NotesSuccess() ));

}
}
void orderNotesByDate(List<NoteModel> notes) {
  notes.sort((a, b) => DateTime.parse(b.date).compareTo(DateTime.parse(a.date)));
 
}