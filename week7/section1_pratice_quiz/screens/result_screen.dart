import 'package:flutter/material.dart';
import '../model/quiz/quiz.dart';
import '../model/submission/submission.dart';
import '../widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final int score;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.score,
    required this.submission,
    required this.quiz,
  });

  Iterable<Widget> _buildAnswerWidgets(
      Question question, Submission submission) {
    Answer? userAnswer = submission.getAnswerFor(question);

    return question.possibleAnswers.map((answer) {
      bool isCorrectAnswer = answer == question.goodAnswer;
      bool isUserAnswer =
          userAnswer != null && userAnswer.questionAnswer == answer;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(
            answer,
            style: TextStyle(
              color: isCorrectAnswer ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 10),

          if (isUserAnswer)
            Icon(
              isCorrectAnswer ? Icons.check : Icons.close,
              color: isCorrectAnswer ? Colors.green : Colors.red,
            ),
        ],
      );
    }).toList();
  }

  Widget _buildQuestionList(Quiz quiz, Submission submission) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: quiz.questions.length,
      itemBuilder: (context, index) {
        final question = quiz.questions[index];
        final userAnswer = submission.getAnswerFor(question);
        final isCorrect = userAnswer != null && userAnswer.isCorrect();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '${index + 1}.',
                    style: TextStyle(
                      fontSize: 16,
                      color: isCorrect ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      question.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ..._buildAnswerWidgets(question, submission),
            ],
          ),
        );
      },
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blue[800],
    appBar: AppBar(
      title: const Text("Quiz Results"),
      centerTitle: true,
      backgroundColor: Colors.blue[900],
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Score display
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'You scored: $score / ${quiz.questions.length}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        // Expanded scrollable area for questions
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: _buildQuestionList(quiz, submission),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Reset button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AppButton(
            icon: Icons.refresh,
            label: "Restart Quiz",
            onTap: onRestart,
          ),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
}
