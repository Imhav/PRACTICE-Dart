import 'package:flutter/material.dart';

void main() {
  runApp(const Ex3());
}

class Ex3 extends StatelessWidget {
  const Ex3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomCard(
                text: "OOP",
                color: Colors.blue[100]!,
              ),
              const SizedBox(height: 20),
              CustomCard(
                text: "DART",
                color: Colors.blue[300]!,
              ),
              const SizedBox(height: 20),
              CustomCard(
                text: "FLUTTER",
                color: Colors.blue[600]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color color;

  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
