import 'package:flutter/material.dart';

import '../student.dart';
import 'custom_bottom_sheet.dart';
import 'students_list.dart';

class CustomListView extends StatefulWidget {
  final bool isActivistsView;
  List test = [];

  CustomListView({super.key, required this.isActivistsView});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    List<Student> students = widget.isActivistsView
        ? StudentsList.of(context)
                ?.students
                .where((element) => element.isActivist)
                .toList() ??
            []
        : StudentsList.of(context)?.students ?? [];

    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 90,
          child: ListTile(
            horizontalTitleGap: 30,
            leading: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(students[index].avatarPath),
            ),
            title: Text('Name: ${students[index].name}'),
            subtitle: Text('GPA: ${students[index].gpa}'),
            trailing: Switch(
              value: students[index].isActivist,
              onChanged: (value) async {
                for (var i = 0; i < 100000; i++) {
                  widget.test.add(Future.delayed(const Duration(hours: 100))
                      .then((value) => Theme.of(context)));
                }
                print(widget.test.length);

                await showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      CustomBottomSheet(student: students[index]),
                );
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }
}
