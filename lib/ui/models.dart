
import 'package:quizzify/ui/questions.dart';



class FetchQuestions{

  static List getAlldiffs() {
    List res = all['results'];
    List<Question> ques =
        List.from(res.map((result) => Question.fromMap(result)));
    ques.shuffle();
    return ques;
  }

  static List getEasy() {
    List res = easy['results'];
    List<Question> ques =
        List.from(res.map((result) => Question.fromMap(result)));
    ques.shuffle();
    return ques;
  }

  static List getMedium() {
    List res = medium['results'];
    List<Question> ques =
        List.from(res.map((result) => Question.fromMap(result)));
    ques.shuffle();
    return ques;
  }

  static List getHard() {
    List res = hard['results'];
    List<Question> ques =
        List.from(res.map((result) => Question.fromMap(result)));
    ques.shuffle();
    return ques;
  }
}


class Question {
  final String question, correctAnswer;
  final List<String> incorrectAnswers;

  Question({this.question, this.correctAnswer, this.incorrectAnswers});

  factory Question.fromMap(Map<String, dynamic> json) {
    return Question(
        question: json['question'],
        correctAnswer: json['correct_answer'],
        incorrectAnswers: json['incorrect_answers']);
  }
}
