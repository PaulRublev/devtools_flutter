// ignore: unused_import
import 'package:devtools_flutter/src/network/album.dart';
import 'package:flutter/material.dart';

import '../student.dart';
import 'custom_list_view.dart';
import 'students_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Student> studentsList = List.castFrom(students);

  @override
  Widget build(BuildContext context) {
    return StudentsList(
      students: studentsList,
      child: MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.people_outline_rounded)),
                  Tab(icon: Icon(Icons.emoji_people_rounded)),
                ],
              ),
              title: const Text('Students'),
              centerTitle: true,
            ),
            body: const TabBarView(
              children: [
                CustomListView(isActivistsView: false),
                CustomListView(isActivistsView: true),
              ],
            ),
            floatingActionButton: FloatingActionButton(onPressed: (() {
              // fetchAlbum(); // UNCOMMENT TO USE NETWORK FEATURES
            })),
          ),
        ),
      ),
    );
  }
}
