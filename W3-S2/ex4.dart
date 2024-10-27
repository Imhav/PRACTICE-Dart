import 'package:flutter/material.dart';

void main() {
  runApp(const Ex4());
}

class Ex4 extends StatelessWidget {
  const Ex4({super.key});

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
                color: Colors.purple[100]!,
              ),
              const SizedBox(height: 20),
              CustomCard(
                text: "DART",
                //color: Colors.blue[300]!,
              ),
              const SizedBox(height: 20),
              CustomCard(
                text: "FLUTTER",
                gradientColors: [Colors.blue.shade300, Colors.blue.shade600],
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
  final List<Color>? gradientColors;

  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue, // Default color set to blue
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: gradientColors == null ? color : null,
        gradient: gradientColors != null 
            ? LinearGradient(colors: gradientColors!)
            : null,
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
