
import '../quiz/quiz.dart';
import '../submission/submission.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  Submission submission = Submission();
  submission.addAnswer(q1, "ronan");
  submission.addAnswer(q2, "red");

  print("Total Score: ${submission.getScore()}"); 

 Answer? answer = submission.getAnswerFor(q1); 
 print(answer?.questionAnswer);

  submission.removeAnswers();
  print(
      "Total Score after removing all answers: ${submission.getScore()}"); 
}