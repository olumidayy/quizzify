import 'package:flutter/material.dart';
import 'models.dart';
import 'widgets.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


class QuestionPage extends StatefulWidget{

  @override
  State<QuestionPage> createState() {
    // TODO: implement createState
    return _QuestionPageState();
  }
}

class _QuestionPageState extends State<QuestionPage>{

  List<Question> questions = getQuestions();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28.0),
            child: Text(
              'Welcome',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
            ),
          ),
          QuestionCard(question: questions[0],)
        ],
      )
    );
  }
}