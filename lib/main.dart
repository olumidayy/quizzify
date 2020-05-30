import 'package:flutter/material.dart';
import './ui/home.dart';
import './ui/question_page.dart';

void main() {
//  print(getQuestions());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
    );
  }
}
