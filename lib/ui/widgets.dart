import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzify/ui/models.dart';
import 'models.dart';
//import 'dart:convert' show utf8;

String sanitize(String str){
  str = str.replaceAll('&#039;', "'");
  str = str.replaceAll('&quot;', '"');
  return str;
}

class QuestionCard extends StatelessWidget{

  final Question question;

  const QuestionCard({Key key, this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<String> options = this.question.incorrectAnswers + [this.question.correctAnswer];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 23),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            for(int i = 0; i < options.length; i++)
              InkWell(
                onTap: (){
                  if(options[i] == this.question.correctAnswer){

                  }
                },
                  child: Option(option: options[i],))
          ],
        ),
      ),
    );
  }

}


class Option extends StatefulWidget{
  final String option;

  const Option({Key key, this.option}) : super(key: key);
  @override
  State<Option> createState() {
    return _OptionState ();
  }

}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
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
                    color: Colors.black,
                    letterSpacing: .5,
                    fontSize: 15),
              ),
            ),
          )),
    );
  }
}