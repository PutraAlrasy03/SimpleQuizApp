import './result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

// void main() {
//   runApp(MyFirstApp());
// }
void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implemented createState
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your Favourite Subject?',
      'answers': [
        {'text': 'Science', 'score': 0},
        {'text': 'Computer', 'score': 0},
        {'text': 'Art', 'score': 0},
        {'text': 'Sport', 'score': 0},
      ],
    },
    {
      'questionText': 'What\'s your Family Income?',
      'answers': [
        {'text': 'B40', 'score': 5},
        {'text': 'M20', 'score': 10},
        {'text': 'T20', 'score': 15},
      ],
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
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!!');
    } else {
      print('No more questions!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    // implemented build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First app'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
