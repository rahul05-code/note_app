import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  TextEditingController titleTxtCntrl = TextEditingController();
  TextEditingController descTxtCntrl = TextEditingController();
  List<Note> notes = [];
  String selID = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes App')),
      body: Column(
        children: [
          // add
          TextField(
            controller: titleTxtCntrl,
            decoration: InputDecoration(
              hintText: 'Enter title',
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
              // add logic
              if (titleTxtCntrl.text.isNotEmpty &&
                  descTxtCntrl.text.isNotEmpty) {
                if (selID == "") {
                  notes.add(
                    Note(
                      id: DateTime.now().toIso8601String(),
                      title: titleTxtCntrl.text,
                      description: descTxtCntrl.text,
                    ),
                  );
                } else {
                  int index = notes.indexWhere(
                    (element) => element.id == selID,
                  );
                  if (index > -1) {
                    notes[index] = Note(
                      id: selID,
                      title: titleTxtCntrl.text,
                      description: descTxtCntrl.text,
                    );
                    //
                    // notes[index].title = titleTxtCntrl.text;
                    // notes[index].description = descTxtCntrl.text;
                    selID = "";
                    setState(() {});
                  }
                  // notes.replaceRange(index, index, [
                  //   Note(
                  //     id: selID,
                  //     title: titleTxtCntrl.text,
                  //     description: descTxtCntrl.text,
                  //   ),
                  // ]);
                }

                titleTxtCntrl.clear();
                descTxtCntrl.clear();
                setState(() {});
              } else {}
            },
            child: Text(selID == "" ? 'Add' : 'Update'),
          ),
          // display
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('${notes[index].title}'),
                subtitle: Text('${notes[index].description}'),
                trailing: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          titleTxtCntrl.text = notes[index].title;
                          descTxtCntrl.text = notes[index].description;
                          selID = notes[index].id;
                          setState(() {});
                        },
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {
                          notes.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
