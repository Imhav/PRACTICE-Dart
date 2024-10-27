import 'package:flutter/material.dart';

void main() {
  runApp(const Ex1());
}

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

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
