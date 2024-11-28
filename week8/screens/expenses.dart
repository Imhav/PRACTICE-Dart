import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../screens/expenselist.dart';

class Expenses extends StatelessWidget {
  Expenses({super.key});

  final List<Expense> _registerExpenses = [
    Expense(
        type: ExpenseType.travel,
        title: "Cambodia",
        amount: 150.5,
        date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpensesList(expenses: _registerExpenses);
  }
}
