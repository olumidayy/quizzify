import 'package:flutter/material.dart';
import 'question_page.dart';
import 'package:direct_select/direct_select.dart';
import 'models.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final difficulties = [
    "Any Difficulty",
    "Easy",
    "Medium",
    "Hard",
  ];

  List functions = [
    FetchQuestions.getAlldiffs(),
    FetchQuestions.getEasy(),
    FetchQuestions.getMedium(),
    FetchQuestions.getHard()
  ];

  int selectedIndex1 = 0;

  List<Widget> _buildDifficulties() {
    return difficulties
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
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
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 28.0),
          child: Text(
            'Start a quiz',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 29),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 28.0),
          child: Text(
            'Choose difficulty',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 16),
            ),
          ),
        ),
        DirectSelect(
            itemExtent: 35.0,
            selectedIndex: selectedIndex1,
            child: MySelectionItem(
              isForList: true,
              title: difficulties[selectedIndex1],
            ),
            onSelectedItemChanged: (index) {
              setState(() {
                selectedIndex1 = index;
                print(selectedIndex1);
              });
            },
            items: _buildDifficulties()),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QuestionPage(
                          questions:
                              functions[selectedIndex1].sublist(0, 10))));
            },
            child: Text(
              'Start Quiz',
              style: GoogleFonts.raleway(
                textStyle: TextStyle(
                    color: Colors.white, letterSpacing: .5, fontSize: 17.5),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;

  const MySelectionItem({Key key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: EdgeInsets.all(10.0),
            )
          : Card(
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_drop_down),
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        title,
      )),
    );
  }
}
