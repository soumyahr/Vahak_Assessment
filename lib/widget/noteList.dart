import 'package:flutter/material.dart';

import '../model/data.dart';
import 'note_item_list.dart';

class NoteList extends StatelessWidget{
  final List<Data> noteList;

  NoteList(this.noteList);

  @override
  Widget build(BuildContext context) {
    return  ListView(
              children: noteList.map(
                (note) => NoteItemList(
                key: ValueKey(note.id),
                note: note,
              )).toList()
    );
  }
}

