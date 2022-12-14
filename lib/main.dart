import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Student> studentsList = List.castFrom(students);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              onTap: (value) {
                setState(() {});
              },
              tabs: [
                Tab(icon: Icon(Icons.people_outline_rounded)),
                Tab(icon: Icon(Icons.emoji_people_rounded)),
              ],
            ),
            title: Text('Students'),
            centerTitle: true,
          ),
          body: TabBarView(
            children: [
              makeStudentsView(),
              makeActivistsView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeStudentsView() {
    return ListView.builder(
      itemCount: studentsList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 90,
          child: ListTile(
            horizontalTitleGap: 30,
            leading: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(studentsList[index].avatarPath),
            ),
            title: Text(studentsList[index].name),
            subtitle: Text(studentsList[index].gpa.toString()),
            trailing: Switch(
              value: studentsList[index].isActivist,
              onChanged: (value) async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: value
                            ? Text(
                                'Add ${studentsList[index].name} with GPA: ${studentsList[index].gpa} to activists?',
                              )
                            : Text(
                                'Remove ${studentsList[index].name} with GPA: ${studentsList[index].gpa} from activists?',
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              studentsList[index].isActivist = value;
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.check_rounded),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                setState(() {});
              },
            ),
          ),
        );
      },
    );
  }

  Widget makeActivistsView() {
    List<Student> activistsList =
        studentsList.where((element) => element.isActivist).toList();
    return ListView.builder(
      itemCount: activistsList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 90,
          child: ListTile(
            horizontalTitleGap: 30,
            leading: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.black,
              backgroundImage: AssetImage(activistsList[index].avatarPath),
            ),
            title: Text(activistsList[index].name),
            subtitle: Text(activistsList[index].gpa.toString()),
            trailing: Switch(
              value: activistsList[index].isActivist,
              onChanged: (value) async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: value
                            ? Text(
                                'Add ${activistsList[index].name} with GPA: ${activistsList[index].gpa} to activists?',
                              )
                            : Text(
                                'Remove ${activistsList[index].name} with GPA: ${activistsList[index].gpa} from activists?',
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              activistsList[index].isActivist = value;
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.check_rounded),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close_rounded),
                          ),
                        ],
                      ),
                    ],
                  ),
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

class Student {
  static const assetsPath = 'assets/images/';

  bool isActivist;
  String name;
  int gpa;
  String avatarPath = '';

  Student(this.name, this.isActivist, this.gpa, path) {
    avatarPath = '$assetsPath$path';
  }
}

List<Student> students = [
  Student('Az Byc', false, 60, 'jelly-armored.png'),
  Student('Ac Dc', false, 65, 'jelly-confused.png'),
  Student('Yn Um', false, 50, 'jelly-sad.png'),
  Student('Wert Rewq', true, 70, 'jelly-confused.png'),
  Student('Nio Oni', false, 40, 'jelly-armored.png'),
  Student('Ap Bic', false, 75, 'jelly-sad.png'),
  Student('Oz Cyc', false, 30, 'jelly-armored.png'),
  Student('Grew Wer', true, 80, 'jelly-confused.png'),
  Student('Hoj Ooui', false, 20, 'jelly-sad.png'),
  Student('Njk Fsd', true, 85, 'jelly-armored.png'),
  Student('Bup Pup', false, 10, 'jelly-sad.png'),
  Student('Qdd Sdd', true, 90, 'jelly-confused.png'),
  Student('Zom Comm', false, 0, 'jelly-armored.png'),
];
