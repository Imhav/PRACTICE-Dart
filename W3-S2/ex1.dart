import 'package:flutter/material.dart';

void main() {
  runApp(const Week1());
}

class Week1 extends StatelessWidget {
  const Week1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      home: Scaffold(
        body: Center(
          child: Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  'First Flutter??? PogChamp',
                  style: TextStyle(
                    color: Colors.yellow,
                      fontSize:50,
                        fontWeight: FontWeight.bold,
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
