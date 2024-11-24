import 'package:flutter/material.dart';
import '../widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;

  const WelcomeScreen(
      {super.key, required this.onStart, required this.quizTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage("assets/w7-s1/quiz-logo.png"),
          height: 400,
        ),
        const SizedBox(height: 10),
        Text(
          quizTitle,
          style: const TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 40),
        AppButton(icon: Icons.arrow_right, label: "Start Quiz", onTap: onStart)
      ],
    );
  }
}
