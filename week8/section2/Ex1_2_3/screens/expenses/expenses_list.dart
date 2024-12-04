import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved});

  final List<Expense> expenses;

  final Function(Expense) onExpenseRemoved;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  Expense? _lastRemovedExpense;
  int? _lastRemovedIndex;

  void _undoRemoval() {
    if (_lastRemovedExpense != null && _lastRemovedIndex != null) {
      setState(() {
        widget.expenses.insert(_lastRemovedIndex!, _lastRemovedExpense!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: widget.expenses.isEmpty
          ? Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(widget.expenses[index].id),
                onDismissed: (direction) {
                  setState(() {
                    _lastRemovedExpense = widget.expenses[index];
                    _lastRemovedIndex = index;
                    widget.onExpenseRemoved(widget.expenses[index]);
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${_lastRemovedExpense!.title} dismissed'),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          _undoRemoval();
                        },
                      ),
                    ),
                  );
                },
                child: ExpenseItem(widget.expenses[index]),
              ),
            ),
    );
  }
}

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible & SnackBar Example'),
      ),
      body: widget.expenses.isEmpty
          ? Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(widget.expenses[index].id),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    setState(() {
                      _lastRemovedExpense = expense;
                      _lastRemovedIndex = index;
                      widget.expenses.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$lastRemovedExpense dismissed'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'UNDO',
                          onPressed: () {
                            setState(() {
                              widget.expenses.insert(lastRemovedIndex!, lastRemovedExpense!);
                            });
                          },
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(widget.expenses[index]),
                  ),
                );
              },
            ),
    );
  }
*/

