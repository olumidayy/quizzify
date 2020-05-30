import 'package:flutter/material.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
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

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28.0),
            child: Text(
              'Start a quiz',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.black,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 29),
              ),
            ),
          ),

          SizedBox(height:300),

          Padding(
            padding: const EdgeInsets.all(28.0),
            child: RaisedButton(
              color: Colors.black,
              onPressed: (){},
              child: Text(
                'Start Quiz',
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      letterSpacing: .5,
                      fontSize: 17.5),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

}