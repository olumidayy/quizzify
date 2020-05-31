import 'package:flutter/material.dart';
import 'models.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'signin.dart';
import 'question_page.dart';

class Result extends StatelessWidget {
  final int score, total;
  final List<Question> questions;

  const Result({Key key, this.score, this.total, this.questions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var percent = ((this.score / this.total) * 100).toStringAsFixed(2);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
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
            animationDuration: 750,
            animation: true,
            percent: double.parse(percent) / 100,
            center: new Text(
              "$percent%",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
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
                          color: Colors.black, letterSpacing: .5, fontSize: 17),
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
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  QuestionPage(questions: questions)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FaIcon(
                        FontAwesomeIcons.redo,
                        size: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
              Text(
                'Retry',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.black, letterSpacing: .5, fontSize: 16),
                ),
              ),
                ],
              ),
              
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuestionPage(questions: questions)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.share,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
          Text(
            'Share',
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 16),
            ),
          ),
            ],
          ),
          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignIn()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FaIcon(
                    FontAwesomeIcons.save,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
          Text(
            'Save',
            textAlign: TextAlign.center,
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 16),
            ),
          ),
            ],
          ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          OutlineButton(
            borderSide: BorderSide(color: Colors.black, width: 1),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Home()));
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
      ),
    ));
  }
}