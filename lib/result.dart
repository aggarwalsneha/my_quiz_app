import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resultHandler;
  Result(this.resultScore,this.resultHandler);
  String get resultPhrase{
    String resultText='Better luck next time!';
    if (resultScore>=8)
      {resultText='You are awesome!';}
    else if(resultScore>=6)
      {resultText='Nice try!';}
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child:Column(
        children: [
          SizedBox(height: 200),
          Text(resultPhrase,
      style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,),
          SizedBox(height: 10),
          Text('Your score',
            style: const TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
          Text('$resultScore',
            style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w400),),
          SizedBox(height: 10),
          OutlinedButton(onPressed: resultHandler,
            child: Text('Restart Quiz'),
            style: OutlinedButton.styleFrom(primary:Colors.deepPurpleAccent,
            side: BorderSide(color:Colors.deepPurpleAccent)),
          )
          ]
    )
    );
  }
}
