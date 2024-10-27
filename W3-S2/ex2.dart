import 'package:flutter/material.dart';

void main() {
  runApp(const Ex2());
}

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ex2practice',
      home: Container(
        color: Colors.blue[300],
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(40),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue[600],
          ),
          child: const Center(
            child: Text(
              'CADT STUDENT',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
    );
  }
}
