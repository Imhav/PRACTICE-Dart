import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType {
  food(type: "Food", icon: Icons.fastfood),
  travel(type: "Travel", icon: Icons.airplanemode_active),
  leisure(type: "Leisure", icon: Icons.beach_access),
  work(type: "Work", icon: Icons.book);

  final String type;
  final IconData icon;
  String get _type => type;
  const ExpenseType({required this.type, required this.icon});

  @override
  String toString() => _type;
}

class Expense {
  static Uuid uuid = const Uuid();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;

  Expense(
      {required this.type,
      required this.title,
      required this.amount,
      required this.date})
      : id = uuid.v4();
}
