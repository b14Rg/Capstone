import 'package:capstone_application/models/budget.dart';
import 'package:capstone_application/models/expense.dart';
import 'package:capstone_application/models/income.dart';

class User {
    int id;
    String email;
    List<Expense> expenses;
    Income income;
    Budget budget;

    User({
        this.id,
        this.email,
        this.expenses,
        this.income,
        this.budget,
    });

    factory User.fromJson(Map<String, dynamic> json) {
      var expenseList = json['expenses'] as List;
      List<Expense> expenses;
      if(expenseList != null){
        expenses = expenseList.map((i) => Expense.fromJson(i)).toList();
      } else {
        expenses = new List<Expense>();
      }

      return User(
        id: json["id"],
        email: json["email"],
        expenses: expenses,
        income: Income.fromJson(json["income"]),
        budget: Budget.fromJson(json["budget"]),
      );
    }

    Map<String, dynamic> toJson() => {
        "email": email,
        "expenses": List<dynamic>.from(expenses.map((x) => x.toJson())),
        "income": income.toJson(),
        "budget": budget.toJson(),
    };
}