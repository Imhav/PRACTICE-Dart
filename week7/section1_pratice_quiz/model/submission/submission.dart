import '../quiz/quiz.dart';

class Answer {
  final Question question;
  final String questionAnswer;

  Answer(this.question, this.questionAnswer);

  bool isCorrect() {
    return questionAnswer == question.goodAnswer;
  }
}

class Submission {
  final Map<Question, Answer> answers = {};



  int getScore() {
    int score = 0;
    for (var answer in answers.values) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    return score;
  }

  Answer? getAnswerFor(Question question) {
    return answers[question];
  }

  void addAnswer(Question question, String answer) {
    answers[question] = Answer(question, answer);
  }

  void removeAnswers() {
    answers.clear();
  }
}

