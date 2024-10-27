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
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(40),
        color: Colors.blue[300],
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
//In this exercise, the Scaffold widget is not used 
//because it is primarily designed to provide a standard layout
// structure for a Flutter app's visual elements, like app bars,
// floating action buttons, drawers, and bottom navigation bars.
// Here, the exercise only creates a simple Container with centered text,
// which doesn’t require the full layout structure that Scaffold offers.