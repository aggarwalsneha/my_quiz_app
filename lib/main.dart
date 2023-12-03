import 'package:flutter/material.dart';
import 'package:my_quiz_app/quiz.dart';
import 'package:my_quiz_app/result.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
  return _MyAppState() ;
  }
}
class _MyAppState extends State<MyApp> {
  var _questionIndex=0;
  var _totalScore=0;
  final _questions=const [
    {'questionText':'Who is the father of Geometry?',
      'answers':[{'text':'Aristotle','score':0},
        {'text':'Euclid','score':2},
      {'text':'Pythagoras','score':0},
        {'text':'Kepler','score':0}]
    },
    {'questionText':'Jamini Roy was a famous?',
      'answers':[{'text':'Producer','score':0},
        {'text':'Painter','score':2},
        {'text':'Dancer','score':0},
        {'text':'Actor','score':0}]
    },
    {'questionText':'\'OS\' computer abbreviation usually means ?',
      'answers':[
        {'text':'Order of Significance','score':0},
        {'text':'Open Software','score':0},
        {'text':'Operating System','score':2},
        {'text':'Optical Sensor','score':0}]
    },
    {'questionText':'Who was known as Iron man of India?',
      'answers':[{'text':'Govind Ballabh Pant','score':0},
    {'text':'Jawaharlal Nehru','score':0},
    {'text':'Subhash Chandra Bose','score':0},
    {'text':'Sardar Vallabhbhai Patel','score':2}]
    }
  ];
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  void _answerQuestion(int score) {
   _totalScore=_totalScore+score;
    setState(() {
      _questionIndex=_questionIndex+1;
    });
    print(_questionIndex);
    if (_questionIndex<_questions.length)
    {
    print('More questions left');
    }
    else
      {
        print('No more questions left');
      }
  }

  @override
  Widget build (BuildContext context){

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(title:const Text('Quizzinga'),
        backgroundColor: Colors.deepPurpleAccent,),
        body: _questionIndex<_questions.length
            ? Quiz(answerQuestion:_answerQuestion,questionIndex:_questionIndex,questions:_questions)
            :Result(_totalScore,_resetQuiz)
    )
    );
  }
}
