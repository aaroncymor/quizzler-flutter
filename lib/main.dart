import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionCtr = 0;

  List<Widget> scoreKeeper = [];
  var items = {
    0: {
      "question": 'You can lead a cow down stairs but not up stairs.',
      "answer": false,
    },
    1: {
      "question": 'Approximately one quarter of human bones are in the feet.',
      "answer": true,
    },
    2: {
      "question": 'A slug\'s blood is green.',
      "answer": true
    }
  };

  void updateScore(bool userAnswer, bool correctAnswer) {
    if (items.length != scoreKeeper.length){
      if (userAnswer == correctAnswer){
        scoreKeeper.add(
          Icon(Icons.check,
            color: Colors.green,
          )
        );
      } else {
        scoreKeeper.add(
          Icon(Icons.close,
            color: Colors.red,
          )
        );
      }      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                items[questionCtr]["question"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool answer = items[questionCtr]["answer"];
                  if (questionCtr < items.length - 1){
                    updateScore(true, answer);
                    questionCtr++;
                  } else if (questionCtr == items.length - 1) {
                    updateScore(true, answer);
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  bool answer = items[questionCtr]["answer"];
                  if (questionCtr < items.length - 1){
                    updateScore(false, answer);
                    questionCtr++;
                  } else if (questionCtr == items.length - 1) {
                    updateScore(false, answer);
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),

        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
