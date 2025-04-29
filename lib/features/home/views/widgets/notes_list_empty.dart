import 'package:flutter/material.dart';

class NotesListEmpty extends StatelessWidget {
  const NotesListEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        const Text(
          'Create your first note!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
