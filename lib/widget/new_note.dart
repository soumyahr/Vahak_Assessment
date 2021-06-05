import 'package:flutter/material.dart';

class NewNote extends StatefulWidget{
  final Function _addNote;

  NewNote(this._addNote);

  @override
  State<StatefulWidget> createState() {
   return _NewNoteState();
  }
}

class _NewNoteState extends State<NewNote>{
  final _addNoteController = TextEditingController();

  void _submitData(){
    final enteredText = _addNoteController.text;

    if(enteredText.isEmpty) {
      return;
    }

    widget._addNote(
      enteredText,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10
          ),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    labelText: 'Add a note'
                ),
                controller: _addNoteController,
                onSubmitted: (_) => _submitData(),
              ),
              ElevatedButton(
                onPressed: _submitData,
                child: Text('Add Note'),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor
                ),
              )
            ],
          )
        ),
        elevation: 5,
      ),
    );
  }
}