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
  Student('Az Byc', false, 60, 'jelly-armored.jpg'),
  Student('Ac Dc', false, 65, 'jelly-confused.jpg'),
  Student('Yn Um', false, 50, 'jelly-sad.jpg'),
  Student('Wert Rewq', true, 70, 'jelly-confused.jpg'),
  Student('Nio Oni', false, 40, 'jelly-armored.jpg'),
  Student('Ap Bic', false, 75, 'jelly-sad.jpg'),
  Student('Oz Cyc', false, 30, 'jelly-armored.jpg'),
  Student('Grew Wer', true, 80, 'jelly-confused.jpg'),
  Student('Hoj Ooui', false, 20, 'jelly-sad.jpg'),
  Student('Njk Fsd', true, 85, 'jelly-armored.jpg'),
  Student('Bup Pup', false, 10, 'jelly-sad.jpg'),
  Student('Qdd Sdd', true, 90, 'jelly-confused.jpg'),
  Student('Zom Comm', false, 0, 'jelly-armored.jpg'),
];
