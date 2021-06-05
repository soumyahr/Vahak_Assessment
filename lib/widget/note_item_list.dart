import 'package:flutter/material.dart';

import '../model/data.dart';

class NoteItemList extends StatelessWidget{
  final Data note;

  const NoteItemList({
    Key key,
    @required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            note.queTime,
            style: TextStyle(
                fontSize: 20.0
            ),
          ),
          Text(
            note.note,
            style: TextStyle(
                fontSize: 20.0
            ),
          )
        ],
      ),
    );
  }
}