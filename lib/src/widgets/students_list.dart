import 'package:flutter/material.dart';

import '../student.dart';

class StudentsList extends InheritedWidget {
  const StudentsList({super.key, required super.child, required this.students});

  final List<Student> students;

  static StudentsList? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StudentsList>();
  }

  @override
  bool updateShouldNotify(StudentsList oldWidget) {
    return true;
  }
}
