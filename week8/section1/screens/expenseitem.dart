import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({
    super.key,
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });

  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType type;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    NumberFormat.currency(symbol: '\$').format(amount),
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: 16.0),
            Row(
              children: [
                Icon(
                  type.icon,
                  color: Colors.black,
                  size: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  DateFormat.yMd().format(date),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
