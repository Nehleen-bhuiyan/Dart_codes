import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

void main() {
  const app_title = "Student Grader v1.0";
  final Set<String> subjects = {"Math", "English", "Science", "Bangla"};

  List<Map<String, dynamic>> students = [];
  int? input;
  do {
    print("""===== Student Grader v1.0 =====

1. Add Student
2. Record Score
3. Add Bonus Points
4. Add Comment
5. View All Students
6. View Report Card
7. Class Summary
8. Exit

Choose an option:""");
    input = int.parse(stdin.readLineSync() ?? '8');
    switch (input) {
      case 1:
        print("Enter student name:");
        String name = stdin.readLineSync() ?? "Unknown";
        List<int> scores = [];
        int? bonus;
        String? comment;

        Map<String, dynamic> student = {
          "name": name,
          "scores": scores,
          "subjects": {...subjects},
          "bonus": bonus,
          "comment": comment,
        };
        students.add(student);

      case 2:
        for (int i = 0; i < students.length; i++) {
          print(students[i]);
        }

        print("Pick a student from 1 to ${students.length}");
        int choice = int.parse(stdin.readLineSync() ?? '0') - 1;
        print("Available subjects:");

        print(subjects);

        print("Enter score for the subjects.");
        int math = -1;
        int english = -1;
        int science = -1;
        int bangla = -1;
        while ((math < 0 || math > 100) ||
            (english < 0 || english > 100) ||
            (science < 0 || science > 100) ||
            (bangla < 0 || bangla > 100)) {
          print("Enter maths marks (0-100):");
          math = int.parse(stdin.readLineSync()!);

          print("Enter english marks (0-100):");
          english = int.parse(stdin.readLineSync()!);

          print("Enter science marks (0-100):");
          science = int.parse(stdin.readLineSync()!);

          print("Enter bangla marks (0-100):");
          bangla = int.parse(stdin.readLineSync()!);
          if ((math < 0 || math > 100) ||
              (english < 0 || english > 100) ||
              (science < 0 || science > 100) ||
              (bangla < 0 || bangla > 100)) {
            print("Marks need to be within 0 to 100");
          }
        }
        students[choice]["scores"] = [math, english, science, bangla];

      case 3:
        for (int i = 0; i < students.length; i++) {
          print(students[i]);
        }
        print("Pick a student from 1 to ${students.length}");
        int choice = int.parse(stdin.readLineSync() ?? '0') - 1;
        print("Add bonus (1-10)");
        int bonus = int.parse(stdin.readLineSync() ?? '1');
        students[choice]["bonus"] ??= bonus;

      case 4:
        for (int i = 0; i < students.length; i++) {
          print(students[i]);
        }
        print("Pick a student from 1 to ${students.length}");
        int choice = int.parse(stdin.readLineSync() ?? '0') - 1;

        String comment = stdin.readLineSync() ?? "No comment provided";
        students[choice]["comment"] = comment;

      case 5:
        for (dynamic student in students) {
          var tags = [
            student["name"],
            "${student["scores"].length} scores",
            if (student["bonus"] != null) "⭐ Has Bonus",
          ];
          print(tags);
        }
      case 6:
        for (int i = 0; i < students.length; i++) {
          print(students[i]);
        }
        print("Pick a student from 1 to ${students.length}");
        int choice = int.parse(stdin.readLineSync() ?? '0') - 1;
        double avrg = 0.0;
        dynamic sum = 0;
        for (dynamic score in students[choice]["scores"]) {
          sum += score;
        }
        avrg = sum / students[choice]["scores"].length;
        double finalAvg = avrg + (students[choice]["bonus"] ?? 0);
        if (finalAvg > 100) finalAvg = 100;
        String? grade;
        if (finalAvg >= 90) {
          grade = "A";
        } else if (finalAvg >= 80) {
          grade = "B";
        } else if (finalAvg >= 70) {
          grade = "C";
        } else if (finalAvg >= 60) {
          grade = "D";
        } else {
          grade = "F";
        }
        print("Report card");
        print("Name:${students[choice]["name"]}");
        print("Scores:${students[choice]["scores"]}");
        print("Bonus:${students[choice]["scores"]}");
        print("Average:$finalAvg");
        print("Grade:$grade");
        print("Comment:${students[choice]["comment"]}");
      case 8:
        break;
    }
  } while (input != 8);
}
