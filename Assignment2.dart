void main() {
  bool isNewStudent = true;
  List<String> students = [];
  List<String> students1 = ["Sakib", "Rahat"];
  Set<String> courses = {"Flutter", "Dart", "Git"};
  Map<String, int> studentAges = {
    "Tonmoy": 22,
    "Sakib": 23,
    "Rahat": 21,
    "Nafis": 24,
    if (isNewStudent) "Rahim": 20,
  };
  students = ["Tonmoy", ...students1, "Nafis", "Rahim"];
  print("Students:");
  print(students);
  print("Courses:");
  print(courses);
  print("Student Ages:");
  for (dynamic student in studentAges.entries) {
    print("${student.key}->${student.value}");
  }
}
