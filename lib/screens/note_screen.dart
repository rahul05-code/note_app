import 'package:flutter/material.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController titleTxtCntrl = TextEditingController();
  TextEditingController descTxtCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notes App')),
      body: Column(
        children: [
          //add
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Title',
              labelText: 'Title',
            ),
          ),

          //display
        ],
      ),
    );
  }
}
