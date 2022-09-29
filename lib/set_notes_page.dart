import 'package:file_operations/view_notes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetNotes extends StatefulWidget {
  const SetNotes({super.key});

  @override
  State<SetNotes> createState() => _SetNotesState();
}

class _SetNotesState extends State<SetNotes> {
  TextEditingController notesController = TextEditingController();

  Future<void> setNotesData(notesvalue) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("noteData", notesvalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('file Operations')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: notesController,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              onPressed: () {
                setNotesData(notesController.text);
              },
              color: CupertinoColors.activeBlue,
              child: const Text('Save'),
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewNotes()),
                );
              },
              color: CupertinoColors.activeGreen,
              child: const Text('View Notes'),
            ),
          ],
        ),
      ),
    );
  }
}