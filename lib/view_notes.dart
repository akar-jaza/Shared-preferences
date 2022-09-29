import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewNotes extends StatefulWidget {
  const ViewNotes({super.key});

  @override
  State<ViewNotes> createState() => _ViewNotesState();
}

class _ViewNotesState extends State<ViewNotes> {
  String? noteValue;

  @override
  void initState() {
    super.initState();
    getNotes();
  }

  void getNotes() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    noteValue = preferences.getString('noteData');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('view Notes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: noteValue == null
              ? const Text('No Notes available')
              : Text(noteValue!),
        ),
      ),
    );
  }
}
