import 'dart:io';

enum Classes {
  one("Grade 1"),
  two("Grade 2"),
  three("Grade 3"),
  four("Grade 4"),
  five("Grade 5"),
  six("Grade 6"),
  seven("Grade 7"),
  eight("Grade 8"),
  nine("Grade 9"),
  ten("Grade 10"),
  eleven("Grade 11"),
  twelve("Grade 12");

  final String label;
  const Classes(this.label);
}

abstract class Person {
  String _name;
  int _age;
  Person(this._name, this._age);
  void printInfo();
}

class Student implements Person {
  Classes _grade;
  String _name;
  int _age;
  Student(this._name, this._age, this._grade);

  String get name => _name; //arrow functions getter
  int get age => _age;
  Classes get grade => _grade;

  @override
  void printInfo() {
    print("Student name:$_name");
    print("Student age:$_age");
    print("Student grade: ${_grade.label}");
  }
}

void addStudent(List<Student> students, String name, int age, Classes grade) {
  print("Adding student...");
  Student newStudent = Student(name, age, grade);
  students.add(newStudent);
  newStudent.printInfo();
  print("");
}

void viewStudents(List<Student> students) {
  //anonymous function
  print("Viewing all students...");
  if (students.length == 0) {
    print("No student found.");
    return;
  }
  students.forEach((student) {
    student.printInfo();
    print("");
  });
}

bool? searchStudent(
  List<Student> students,
  String name,
  int age,
  Classes grade,
) {
  bool studentFound = false;
  students.forEach((student) {
    if (student.name == name && student.age == age && student.grade == grade) {
      studentFound = true;
    }
  });
  return studentFound;
}

bool? deleteStudent(
  List<Student> students,
  String name,
  int age,
  Classes grade,
) {
  bool isFound = false;
  Student? deleted;
  students.forEach((student) {
    if (student.name == name && student.age == age && student.grade == grade) {
      deleted = student;
      isFound = true;
    }
  });
  students.remove(deleted);
  return isFound;
}

Classes getGrade(int grade) {
  return Classes.values[grade - 1];
}

void main() {
  List<Student> students = [];

  while (true) {
    print("""===== Student Information Manager =====
1. Add Student
2. View Students
3. Search Student
4. Delete Student
5. Exit""");
    print("Enter your choice:");
    int choice = int.parse(stdin.readLineSync() ?? '1');
    switch (choice) {
      case 1:
        print("Enter name:");
        String name = stdin.readLineSync() ?? "Name not given";
        print("Enter age:");
        int age = int.parse(stdin.readLineSync() ?? '0');
        print("Choose grade:from 1 to 12");
        int grade = int.parse(stdin.readLineSync() ?? '1');
        while (grade > 12 || grade < 0) {
          print("Choose a valid grade");
          grade = int.parse(stdin.readLineSync() ?? '1');
        }
        addStudent(students, name, age, getGrade(grade));
      case 2:
        viewStudents(students);
      case 3:
        print("Enter name:");
        String name = stdin.readLineSync() ?? "Name not given";
        print("Enter age:");
        int age = int.parse(stdin.readLineSync() ?? '0');
        print("Choose grade:from 1 to 12");
        int grade = int.parse(stdin.readLineSync() ?? '1');
        bool? isFound = searchStudent(students, name, age, getGrade(grade));
        if (isFound == true)
          print("Student found");
        else
          print("Student not found");
      case 4:
        print("Enter name:");
        String name = stdin.readLineSync() ?? "Name not given";
        print("Enter age:");
        int age = int.parse(stdin.readLineSync() ?? '0');
        print("Choose grade:from 1 to 12");
        int grade = int.parse(stdin.readLineSync() ?? '1');
        bool? isDeleted = deleteStudent(students, name, age, getGrade(grade));
        if (isDeleted == true) {
          print("Student deleted");
        } else {
          print("Student not found");
        }
      case 5:
        break;
      default:
        break;
    }
    if (choice == 5) break;
  }
}
