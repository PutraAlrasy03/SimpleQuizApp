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
      'questionText':
          'Im motivated to study at University because I would like:',
      'answers': [
        {
          'text':
              'To gain the knowledge and skills necessary to have an impact on the world.',
          'score': 0
        },
        {
          'text': 'To develop a successful career within a large organization.',
          'score': 0
        },
        {
          'text':
              'To gain the tools needed to help me launch my own business project.',
          'score': 0
        },
      ],
    },
    {
      'questionText': 'I identify most with',
      'answers': [
        {'text': 'Being creative and innovative.', 'score': 5},
        {'text': 'Being critical and analytical.', 'score': 10},
        {'text': 'Being empathetic and sociable.', 'score': 15},
      ],
    },
    {
      'questionText': 'When working in a team, I am the person who:',
      'answers': [
        {
          'text': 'Defines the objectives and methodology for the task.',
          'score': 5
        },
        {
          'text': 'Organizes the team based on everyone personal strengths',
          'score': 10
        },
        {'text': 'Comes up with the creative ideas.', 'score': 15},
      ],
    },
    {
      'questionText': '10 years from now, I see myself:',
      'answers': [
        {
          'text':
              'Developing my own initiative which will have a positive impact on the world.',
          'score': 5
        },
        {
          'text': 'Working with the latest technological advancements',
          'score': 10
        },
        {
          'text': 'Working across a range of different international contexts',
          'score': 15
        },
        {'text': 'Connecting with a wide range of individuals.', 'score': 15},
      ],
    },
    {
      'questionText': 'In High School I mainly focused on:',
      'answers': [
        {
          'text':
              'Analyzing complex situations and coming up with solutions for them.',
          'score': 5
        },
        {
          'text': 'Creating projects which will have an impact on society.',
          'score': 10
        },
        {'text': 'Solving numerical problems.', 'score': 15},
      ],
    },
    {
      'questionText':
          'Im boarding a plane and must choose only one magazine to accompany the trip, Im more likely to choose:',
      'answers': [
        {'text': 'National Geographic.', 'score': 5},
        {'text': 'The Economist.', 'score': 10},
        {'text': 'Wired', 'score': 15},
      ],
    },
    {
      'questionText':
          'I have to choose to read an article, I would first read:',
      'answers': [
        {
          'text': 'How blockchain can help improve cybersecurity in your home.',
          'score': 5
        },
        {'text': 'Nike reinvents their trademark image', 'score': 10},
        {'text': 'Can GDP help us measure happiness?', 'score': 15},
        {'text': 'A new start-up is stirring up Silicon Valley.', 'score': 15},
      ],
    },
    {
      'questionText': 'I would love to work for:',
      'answers': [
        {'text': 'IKEA', 'score': 5},
        {'text': 'UN', 'score': 10},
        {'text': 'Uber', 'score': 15},
        {'text': 'Samsung', 'score': 15},
        {'text': 'Unicef', 'score': 15},
      ],
    },
    {
      'questionText': 'I would like to learn more about:',
      'answers': [
        {'text': 'Art and philosophy.', 'score': 5},
        {'text': 'History, geography, and languages.', 'score': 10},
        {'text': 'Math, physics, and chemistry.', 'score': 15},
      ],
    },
    {
      'questionText': 'Im most comfortable in situations where Im:',
      'answers': [
        {
          'text':
              'Making the most of technological resources to learn as quickly as possible.',
          'score': 5
        },
        {'text': 'Researching and learning by myself.', 'score': 10},
        {
          'text':
              'Working with other people and sharing our knowledge together.',
          'score': 15
        },
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
