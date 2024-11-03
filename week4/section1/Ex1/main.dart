import 'package:flutter/material.dart';

class HobbyCard extends StatelessWidget {
  final String text;
  final Color colors;
  final IconData icon;

  const HobbyCard({
    super.key,
    required this.text,
    required this.icon,
    this.colors = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors,
      ),
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Center(
        child: Row(
          children: [
            const Padding(   
              padding: EdgeInsets.only(right: 30),
            ),
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(width: 20), // Adjust spacing between icon and text
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const Ex1());
}

class Ex1 extends StatelessWidget {
  const Ex1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Hobbies",
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
          backgroundColor: const Color.fromARGB(255, 235, 173, 194),
        ),
        body: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                text: 'Gaming',
                icon: Icons.gamepad,
                colors: Colors.purple,
              ),
              HobbyCard(
                text: 'Coding',
                icon: Icons.code_off,
              ),
              HobbyCard(
                text: 'Music',
                icon: Icons.music_note,
                colors: Colors.lime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
