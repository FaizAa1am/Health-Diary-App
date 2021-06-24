import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'output.dart';
class DepressionCalculator extends StatefulWidget {
  @override
  _DepressionCalculatorState createState() => _DepressionCalculatorState();
}

class _DepressionCalculatorState extends State<DepressionCalculator> {
  var questionIndex = 0;
  var totalScore = 0;
  final questions = [
    {
      'questionText' : 'Little interest or pleasure in doing things within last two weeks',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'Feeling down, depressed, or hopeless within last two weeks',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'Within last two weeks, did you felt trouble falling or staying asleep, or sleeping too much',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'Feeling tired or having the little energy within last two weeks',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'Poor appetite or overeating within last two weeks',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'Within last two weeks, have you been feeling bad about yourself, or that you a failure, or have let yourself or your family down',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'Trouble concentrating on things, such as reading the newspaper or watching television within last two weeks',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'In the last two weeks, have you been moving or speaking so slowly that other people could have noticed? Or the opposite, being so fidgety or restless that you have been moving around a lot more than usual',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
    {
      'questionText' : 'In the last two weeks, have you been thinking that you would be better off dead or of hurting yourself in some way',
      'answers':[
        {'text':'Not at all','score':0},
        {'text':'Several days','score':1},
        {'text':'More than half the days','score':2},
        {'text':'Nearly everyday','score':3}
      ]
    },
  ];
  int radioGroup = 0;
  int score = 0;
  void moveNext() {
    setState(() {
      questionIndex += 1;
      score = score + radioGroup;
    });
  }
  void restartTest() {
    setState(() {
      questionIndex = 0;
      score = 0;
    });
  }
  String message = '';
  @override
  Widget build(BuildContext context) {
    if(score>=0 && score<=4) {
      message = 'No depression';
    }
    else if(score>=5 && score<=9) {
      message = 'Mild depression';
    }
    else if(score>=10 && score<=14) {
      message = 'Moderate depression';
    }
    else if(score>=15 && score<=19) {
      message = 'Moderately severe depression';
    }
    else if(score>=20 && score<=27) {
      message = 'Severe depression';
    }
    double percentage = (score*100)/27;
    return Scaffold(
        appBar: AppBar(
          title: Text("Depression Calculator",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[900],Colors.lightBlue,Colors.lightBlueAccent,Colors.lightBlue,Colors.lightBlueAccent]
              )
          ),
          child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,top: 40,right: 10),
                  child: questionIndex < questions.length ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(questions[questionIndex]['questionText'],style:TextStyle(fontSize:20,color: Colors.white)),
                      Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 0,
                              activeColor: Colors.amber,
                              groupValue: radioGroup,
                              onChanged: (val) {
                                print(val);
                                setState(() {
                                  radioGroup = val;
                                });
                              },
                            ),
                            Text("Not at all",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              activeColor: Colors.amber,
                              groupValue: radioGroup,
                              onChanged: (val) {
                                print(val);
                                setState(() {
                                  radioGroup = val;
                                });
                              },
                            ),
                            Text("Several days",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 2,
                              activeColor: Colors.amber,
                              groupValue: radioGroup,
                              onChanged: (val) {
                                print(val);
                                setState(() {
                                  radioGroup = val;
                                });
                              },
                            ),
                            Text("More than half the days",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 3,
                              activeColor: Colors.amber,
                              groupValue: radioGroup,
                              onChanged: (val) {
                                print(val);
                                setState(() {
                                  radioGroup = val;
                                });
                              },
                            ),
                            Text("Nearly everyday",style: TextStyle(fontSize: 20,color: Colors.white),),
                          ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          FloatingActionButton(onPressed: moveNext,backgroundColor: Colors.amberAccent, child: Icon(Icons.arrow_forward_rounded,color: Colors.lightBlue,)),
                        ],
                      ),
                    ],
                  ) : Column(
                    children: [
                      SizedBox(height: 10,),
                      Text(message,style: TextStyle(fontSize: 24,color: Colors.white),),
                      SizedBox(height: 100,),
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 2000,
                        radius: 300,
                        center: Text("${(score)}",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),),
                        progressColor: Colors.amberAccent,
                        percent: percentage/100,
                        lineWidth: 30,
                        circularStrokeCap: CircularStrokeCap.round,
                      ),
                      SizedBox(height: 20,),
                      Text("Your score is ${score}",style: TextStyle(fontSize: 22,color: Colors.white),),
                      SizedBox(height: 20,),
                      Output(restartTest),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}
