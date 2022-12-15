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
