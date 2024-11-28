import 'package:flutter/material.dart';
import '../model/quiz/quiz.dart';
import '../screens/question_screen.dart';
import '../screens/result_screen.dart';
import '../screens/welcome_screen.dart';
import '../model/submission/submission.dart';

Color appColor = Colors.blue[500]!;

enum ScreenState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  ScreenState _currentScreenState = ScreenState.notStarted;
  Submission _submission = Submission();
  int currentQuestionIndex = 0;

  void _startQuiz() {
    setState(() {
      _currentScreenState = ScreenState.started;
      currentQuestionIndex = 0;
      _submission = Submission();
    });
  }

  void _answerQuestion(String answer) {
    Question currentQuestion = widget.quiz.questions[currentQuestionIndex];
    _submission.addAnswer(currentQuestion, answer);

    setState(() {

      if (currentQuestionIndex < widget.quiz.questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _currentScreenState = ScreenState.finished;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _currentScreenState = ScreenState.notStarted;
      currentQuestionIndex = 0;
      _submission = Submission();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    switch (_currentScreenState) {
      case ScreenState.notStarted:
        currentScreen = WelcomeScreen(
          quizTitle: widget.quiz.title,
          onStart: _startQuiz,
        );
        break;
      case ScreenState.started:
        currentScreen = QuestionScreen(
          question: widget.quiz.questions[currentQuestionIndex],
          onAnswerSelected: _answerQuestion, 
        );
        break;
      case ScreenState.finished:
        currentScreen = ResultScreen(
          score: _submission.getScore(), 
          submission: _submission,
          quiz: widget.quiz,
          onRestart: _resetQuiz,
        );
        break;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: Colors.blue[800],
        ),
        body: Center(child: currentScreen),
      ),
    );
  }
}
