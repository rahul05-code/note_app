import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleTxtCntrl = TextEditingController();
  TextEditingController descTxtCntrl = TextEditingController();
  List<Note> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes App')),
      body: Column(
        children: [
          //add
          TextField(
            controller: titleTxtCntrl,
            decoration: InputDecoration(
              hintText: 'Enter Title',
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: descTxtCntrl,
            decoration: InputDecoration(
              hintText: 'Enter Description',
              labelText: 'Description',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleTxtCntrl.text.isNotEmpty &&
                  descTxtCntrl.text.isNotEmpty) {
                notes.add(
                  Note(
                    title: titleTxtCntrl.text,
                    descreption: descTxtCntrl.text,
                  ),
                );
                setState(() {});
              } else {}
            },
            child: Text('Add'),
          ),

          //display
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('${notes[index].title}'),
                subtitle: Text('${notes[index].descreption}'),
                trailing: Icon(Icons.delete),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
