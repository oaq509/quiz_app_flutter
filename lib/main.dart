// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, annotate_overrides, unused_local_variable, prefer_const_literals_to_create_immutables, deprecated_member_use, sort_child_properties_last, avoid_print, sized_box_for_whitespace

import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() { 
  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'How much is whitebeard bounty ?',
      'answers': [
        {'text': '6 Billion', 'score': 0},
        {'text': '5 Billion', 'score': 100},
        {'text': '4 Billion', 'score': 0}
      ],
    },
    {
      'questionText': 'Who was the yongest pirate member in roger pirates ?',
      'answers': [
        {'text': 'Nekomamushi', 'score': 0},
        {'text': 'Buggy', 'score': 0},
        {'text': 'Shanks', 'score': 100}
      ]
    },
    {
      'questionText': 'Who is the third member joind to luffy ?',
      'answers': [
        {'text': 'Zoro', 'score': 0},
        {'text': 'Nami', 'score': 100},
        {'text': 'Sanji', 'score': 0}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Container(
                width: double.infinity,
                child: Text(
                  'Anime Quiz',
                  textAlign: TextAlign.center,
                )),
            backgroundColor: Colors.redAccent,
          ),
          body: Column(children: [
            Image(
              width: double.infinity,
              image: NetworkImage(
                  'https://static.wikia.nocookie.net/onepiece/images/b/b7/Edward_Newgate_Anime_Infobox.png/revision/latest/scale-to-width-down/350?cb=20130519004643'),
            ),
            _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questions: _questions,
                    questionIndex: _questionIndex,
                  )
                : Result(_totalScore, _resetQuiz),
          ])),
    );
  }
}
