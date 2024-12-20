import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../screens/expenselist.dart';

class Expenses extends StatelessWidget {
  Expenses({super.key});

  final List<Expense> _registerExpenses = [
    Expense(
        type: ExpenseType.work,
        title: "ronan the best book.",
        amount: 15000,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpensesList(expenses: _registerExpenses);
  }
}
