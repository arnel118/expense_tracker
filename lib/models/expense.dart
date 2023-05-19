import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

//define an enum for the category of the expense = assigned value for category
enum Category { 
  food, travel, leisure, work, other
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight,
  Category.leisure: Icons.sports_soccer,
  Category.work: Icons.work,
  Category.other: Icons.attach_money,
};

class Expense { 
  Expense({
    required this.title, 
    required this.amount, 
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense>
    allExpenses, this.category,) 
      : expenses = allExpenses
        .where((expense) => expense.category == category)
        .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      // sum = sum + expense.amount;
      sum += expense.amount; 
    }

    return sum;
  }
}