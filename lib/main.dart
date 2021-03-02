import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      //const = compile time constant
      {
        'questionText': 'What\'s your favourite color?',
        'answers': ['Black', 'Red', 'Green', 'White'],
      },
      {
        'questionText': "What's your favourite animal?",
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
      },
      {
        'questionText': "What's your favourite language?",
        'answers': ['C', 'Kotlin', 'Flutter', 'Java'],
      }
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("My First App")),
          body: Column(
            children: [
              Question(questions[_questionIndex]
                  ['questionText']), //Text Question on top
              ...(questions[_questionIndex]['answers'] as List<String>)
                  .map((answer) {
                // ... insert all the values of a list into another list
                return Answer(_answerQuestion,
                    answer); // map transform that list into widget & generate new list based on old list
              }).toList() //convert the value map give us to a list
            ],
          )),
    );
  }
}
