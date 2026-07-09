import 'dart:io';

extension AmountFormatter on double {
  String formatAmount() {
    return "৳${toStringAsFixed(2)}";
  }
}

class Expense {
  String title;
  double amount;
  String category;
  static double totalAmount = 0.0;
  Expense({required this.title, required this.amount, required this.category}) {
    totalAmount += amount;
  }

  void display() {
    print(
      'Title: $title   - Amount: ${amount.formatAmount()}   - Category: $category',
    );
  }
}

class Food extends Expense {
  Food({
    required String title,
    required double amount,
    required String category,
  }) : super(title: title, amount: amount, category: category);

  @override
  void display() {
    print("Food expenses:");
    super.display();
  }
}

class Transport extends Expense {
  Transport({
    required String title,
    required double amount,
    required String category,
  }) : super(title: title, amount: amount, category: category);

  @override
  void display() {
    print("Transport expenses:");
    super.display();
  }
}

class Entertainment extends Expense {
  Entertainment({
    required String title,
    required double amount,
    required String category,
  }) : super(title: title, amount: amount, category: category);

  @override
  void display() {
    print("Entertainment expenses:");
    super.display();
  }
}

void main() {
  List<Expense> expenses = [];
  while (true) {
    print("""===== Expense Tracker =====

1. Add Expense
2. View All Expenses
3. Show Total Expenses
4. Exit

Choose Option: """);
    int choice = int.parse(stdin.readLineSync() ?? '1');
    switch (choice) {
      case 1:
        print("Enter expense title:");
        String title = stdin.readLineSync() ?? "Title not given";
        print("Enter expense amount:");
        double amount = double.parse(stdin.readLineSync() ?? '0');
        print(
          "Choose expense category (1.Food, 2.Transport, 3.Entertainment):",
        );
        int categoryChoice = int.parse(stdin.readLineSync() ?? '1');
        String category;
        switch (categoryChoice) {
          case 1:
            category = "Food";
            expenses.add(
              Food(title: title, amount: amount, category: category),
            );
            break;
          case 2:
            category = "Transport";
            expenses.add(
              Transport(title: title, amount: amount, category: category),
            );
            break;
          case 3:
            category = "Entertainment";
            expenses.add(
              Entertainment(title: title, amount: amount, category: category),
            );
            break;
          default:
            print("Invalid category choice");
            continue;
        }
        print("Expense added successfully!");
        break;
      case 2:
        print("All Expenses:");
        for (var expense in expenses) {
          expense.display();
          print("--------------------");
        }
        break;

      case 3:
        print("Total expenses:");
        print(Expense.totalAmount.formatAmount());
      case 4:
        print("Thank you for using the Expense Tracker. Goodbye!");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
    if (choice == 4) break;
  }
}
