import 'package:flutter/material.dart';
import 'models.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

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
    print(questions.length);
    Question question = questions[index];
    List options = question.incorrectAnswers + [question.correctAnswer];
    options.shuffle();
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
        width: 300,
          decoration: BoxDecoration(
            color: Colors.blueAccent[100],
            border: Border.all(color: Colors.blueAccent, width: 2),
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

class Result extends StatelessWidget {
  final int score, total;
  final List<Question> questions;

  const Result({Key key, this.score, this.total, this.questions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var percent = ((this.score / this.total) * 100).toStringAsFixed(2);
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 28.0, 15, 5),
                child: Text(
                  'Your score',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: .5,
                        // fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                ),
              ),
            ),
            new CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: double.parse(percent) / 100,
              center: new Text(
                "$percent%",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: new Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 28.0, 15, 5),
                    child: Text(
                      'Total number of Questions asked: ${this.total}',
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: .5,
                            // fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 28.0, 15, 5),
                    child: Text(
                      'Number of Questions answered correctly: ${this.score}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.black,
                            letterSpacing: .5,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: double.parse(percent) >= 70
                  ? Colors.green
                  : double.parse(percent) >= 50
                      ? Colors.yellow
                      : double.parse(percent) > 39 ? Colors.orange : Colors.red,
            ),
            SizedBox(height:30),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuestionPage(questions: questions)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FaIcon(
                  FontAwesomeIcons.redo,
                  size: 50,
                ),
              ),
            ),
            Text(
              'Retry this quiz',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 16),
              ),
            ),
            SizedBox(height: 30,),
            OutlineButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text(
              'Home',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.black, letterSpacing: .5, fontSize: 16),
              ),
            ),
            )
          ]),
    ));
  }
}
