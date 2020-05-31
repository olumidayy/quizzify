import 'package:flutter/material.dart';
import 'models.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'home.dart';
import 'result.dart';


class QuestionPage extends StatefulWidget {
  final List<Question> questions;

  const QuestionPage({Key key, this.questions}) : super(key: key);
  @override
  State<QuestionPage> createState() {
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage> {
  int index = 0, tots = 0;
  @override
  Widget build(BuildContext context) {
    List<Question> questions = (widget.questions);
    Question question = questions[index];
    print(question.correctAnswer);
    List options = question.incorrectAnswers + [question.correctAnswer];
    // options.shuffle();
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 28.0, 15, 5),
          child: Text(
            'Question ${index + 1}/${questions.length}',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.black,
                  letterSpacing: .5,
                  // fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 23),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(children: <Widget>[
              Text(
                sanitize(question.question),
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.black, letterSpacing: .5, fontSize: 20),
                ),
              ),
              SizedBox(height: 50),
              Column(
                children: <Widget>[
                  for (int i = 0; i < options.length; i++)
                    InkWell(
                        onTap: () {
                          if (index < questions.length - 1) {
                            setState(() {
                              index++;
                            });
                          } else {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Result(
                                          score: tots,
                                          total: questions.length,
                                          questions: questions,
                                        )));
                          }
                          if (options[i] == question.correctAnswer) {
                            setState(() {
                              tots++;
                              print(tots);
                            });
                          }
                        },
                        child: Option(
                          option: options[i],
                        ))
                ],
              )
            ]),
          ),
        )
      ],
    ));
  }
}

class Option extends StatefulWidget {
  final String option;

  const Option({Key key, this.option}) : super(key: key);
  @override
  State<Option> createState() {
    return _OptionState();
  }
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.center,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blueAccent[100],
            border: Border.all(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
            child: Text(
              sanitize(widget.option),
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 15),
              ),
            ),
          )),
    );
  }
}

String sanitize(String str) {
  str = str.replaceAll('&#039;', "'");
  str = str.replaceAll('&quot;', '"');
  return str;
}


