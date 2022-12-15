import 'package:flutter/material.dart';

import '../student.dart';

class CustomBottomSheet extends StatelessWidget {
  final Student student;

  const CustomBottomSheet({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: !student.isActivist
              ? Text(
                  'Add ${student.name} with GPA: ${student.gpa} to activists?',
                )
              : Text(
                  'Remove ${student.name} with GPA: ${student.gpa} from activists?',
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                student.isActivist = !student.isActivist;
                Navigator.pop(context);
              },
              child: const Icon(Icons.check_rounded),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close_rounded),
            ),
          ],
        ),
      ],
    );
  }
}
