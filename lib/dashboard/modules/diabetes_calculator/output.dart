import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Output extends StatefulWidget {
  @override
  _OutputState createState() => _OutputState();
}

class _OutputState extends State<Output> {
  // Radio button group variables
  var ageValue = '';
  var bmiValue = '';
  var genderValue = '';
  var waistValue = '';
  var activityValue = '';
  var foodValue = '';
  var medValue = '';
  var glucoseValue = '';
  var familyValue = '';
  String pct = '';
  // Score variables
  int ageScore,bmiScore,waistScore,activityScore,foodScore,medScore,glucoseScore,familyScore,totalScore = 0;

  String diabetesRisk = '';
  double percentage = 0.0;
  // Function to display popup for age
  ageAlertDialog(BuildContext context) {

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
          title: Text("Age"),
          scrollable: true,
          content: Column(
            children: [
              Row(
                children: [
                  Radio(
                    value: "Less than 45 years",
                    groupValue: ageValue,
                    onChanged: (val) {
                      setState(() {
                        ageValue = val;
                        ageScore = 0;
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  Text("Less than 45 years"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "45-54 years",
                      groupValue: ageValue,
                      onChanged: (val) {
                        setState(() {
                          ageValue = val;
                          ageScore = 2;
                          Navigator.of(context).pop();
                        });
                      }
                  ),
                  Text("45-54 years"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "55-64 years",
                      groupValue: ageValue,
                      onChanged: (val) {
                        setState(() {
                          ageValue = val;
                          ageScore = 3;
                          Navigator.of(context).pop();
                        });
                      }
                  ),
                  Text("55-64 years"),
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: "Over 64 years",
                      groupValue: ageValue,
                      onChanged: (val) {
                        setState(() {
                          ageValue = val;
                          ageScore = 4;
                          Navigator.of(context).pop();
                        });
                      }
                  ),
                  Text("Over 64 years"),
                ],
              ),
            ],
          )
      );
    });
  }

  // Function to display popup for bmi
  bmiAlertDialog(BuildContext context) {

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("BMI"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(
                    value: 'Lower than 25', groupValue: bmiValue,
                    onChanged: (val) {setState(() {
                      bmiValue = val;
                      bmiScore = 0;
                      Navigator.of(context).pop();
                    }
                    );}
                ),
                Text("Lower than 25"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: '25-30', groupValue: bmiValue,
                    onChanged: (val) {setState(() {
                      bmiValue = val;
                      bmiScore = 1;
                      Navigator.of(context).pop();
                    }
                    );}
                ),
                Text("25-30"),
              ],
            ),
            Row(
              children: [
                Radio(
                    value: 'Higher than 30', groupValue: bmiValue,
                    onChanged: (val) {setState(() {
                      bmiValue = val;
                      bmiScore = 3;
                      Navigator.of(context).pop();
                    }
                    );}
                ),
                Text("Higher than 30"),
              ],
            ),
          ],
        ),
      );
    });

  }

  // Function to display popup for gender
  genderAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("You are"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(value: "Male", groupValue: genderValue,
                    onChanged: (val) {
                      setState(() {
                        genderValue = val;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("Male"),
                Radio(value: "Female", groupValue: genderValue,
                    onChanged: (val) {
                      setState(() {
                        genderValue = val;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("Female"),
              ],
            ),
          ],
        ),
      );
    });
  }

  // Function to display popup for waist circumference
  waistAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Waist Circumference"),
        scrollable: true,
        content: Container(
          child: (genderValue == "Male" ? Column(
            children: [
              Row(
                children: [
                  Radio(value: "Less than 94 cm", groupValue: waistValue, onChanged: (val) {
                    setState(() {
                      waistValue = val;
                      waistScore = 0;
                      Navigator.of(context).pop();
                    });}),
                  Text("Less than 94 cm"),
                ],
              ),
              Row(
                children: [
                  Radio(value: "94-102 cm", groupValue: waistValue, onChanged: (val) {
                    setState(() {
                      waistValue = val;
                      waistScore = 3;
                      Navigator.of(context).pop();
                    });
                  }),
                  Text("94-102 cm"),
                ],
              ),
              Row(
                children: [
                  Radio(value: 'More than 102 cm', groupValue: waistValue, onChanged: (val) {
                    waistValue = val;
                    waistScore = 4;
                    Navigator.of(context).pop();
                  }),
                  Text("More than 102 cm"),
                ],
              )
            ],
          ) : Column(
            children: [
              Row(
                children: [
                  Radio(value: "Less than 80 cm", groupValue: waistValue, onChanged: (val) {
                    setState(() {
                      waistValue = val;
                      waistScore = 0;
                      Navigator.of(context).pop();
                    });}),
                  Text("Less than 80 cm"),
                ],
              ),
              Row(
                children: [
                  Radio(value: "80-88 cm", groupValue: waistValue, onChanged: (val) {
                    setState(() {
                      waistValue = val;
                      waistScore = 3;
                      Navigator.of(context).pop();
                    });
                  }),
                  Text("80-88 cm"),
                ],
              ),
              Row(
                children: [
                  Radio(value: 'More than 88 cm', groupValue: waistValue, onChanged: (val) {
                    waistValue = val;
                    waistScore = 4;
                    Navigator.of(context).pop();
                  }),
                  Text("More than 88 cm"),
                ],
              )
            ],
          )
          ),
        ),
      );
    });

  }

  // Function to display popup for physical activity
  activityAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Physical activity"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(value: "Yes", groupValue: activityValue,
                    onChanged: (val) {
                      setState(() {
                        activityValue = val;
                        activityScore = 0;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("Yes"),
                Radio(value: "No", groupValue: activityValue,
                    onChanged: (val) {
                      setState(() {
                        activityValue = val;
                        activityScore = 2;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("No"),
              ],
            ),
          ],
        ),
      );
    });
  }

  // Function to display popup for food
  foodAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Vegetables, fruit or berries"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(value: "Everyday", groupValue: foodValue,
                    onChanged: (val) {
                      setState(() {
                        foodValue = val;
                        foodScore = 0;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("Everyday"),
              ],
            ),
            Row(children: [
              Radio(value: "Not everyday", groupValue: foodValue,
                  onChanged: (val) {
                    setState(() {
                      foodValue = val;
                      foodScore = 1;
                      Navigator.of(context).pop();
                    });
                  }
              ),
              Text("Not everyday"),
            ],)
          ],
        ),
      );
    });
  }

  // Function to display popup for medication
  medAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Medication for high blood pressure"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(value: "No", groupValue: medValue,
                    onChanged: (val) {
                      setState(() {
                        medValue = val;
                        medScore = 0;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("No"),
              ],
            ),
            Row(children: [
              Radio(value: "Yes", groupValue: medValue,
                  onChanged: (val) {
                    setState(() {
                      medValue = val;
                      medScore = 2;
                      Navigator.of(context).pop();
                    });
                  }
              ),
              Text("Yes"),
            ],)
          ],
        ),
      );
    });
  }

  // Function to display popup for glucose
  glucoseAlertDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("High blood glucose"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(value: "No", groupValue: glucoseValue,
                    onChanged: (val) {
                      setState(() {
                        glucoseValue = val;
                        glucoseScore = 0;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("No"),
              ],
            ),
            Row(children: [
              Radio(value: "Yes", groupValue: glucoseValue,
                  onChanged: (val) {
                    setState(() {
                      glucoseValue = val;
                      glucoseScore = 5;
                      Navigator.of(context).pop();
                    });
                  }
              ),
              Text("Yes"),
            ],)
          ],
        ),
      );
    });
  }

  // Function to display popup for family diabetes
  familyDiabetesDialog(BuildContext context) {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Diabetes to any family member"),
        scrollable: true,
        content: Column(
          children: [
            Row(
              children: [
                Radio(value: "No", groupValue: familyValue,
                    onChanged: (val) {
                      setState(() {
                        familyValue = val;
                        familyScore = 0;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("No"),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Radio(value: "Yes: grandparent, aunt, uncle or first cousin", groupValue: familyValue,
                    onChanged: (val) {
                      setState(() {
                        familyValue = val;
                        familyScore = 3;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("Yes: grandparent, aunt, uncle or first cousin"),
              ],
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Radio(value: "Yes: parent, brother, sister or own child", groupValue: familyValue,
                    onChanged: (val) {
                      setState(() {
                        familyValue = val;
                        familyScore = 5;
                        Navigator.of(context).pop();
                      });
                    }
                ),
                Text("Yes: parent, brother, sister or own child"),
              ],
            ),
          ],
        ),
      );
    });
  }

  createResultDialog(BuildContext context) {

    // Calculating total score
    totalScore = ageScore+bmiScore+waistScore+activityScore+foodScore+medScore+glucoseScore+familyScore;
    percentage = (totalScore / 20)*100;
    pct = percentage.toStringAsFixed(0);
    if(totalScore<7) {
      diabetesRisk = 'Low: estimated 1 in 100 will develop disease';
    }
    else if(totalScore>=7 && totalScore<=11) {
      diabetesRisk = 'Slightly elevated (estimated 1 in 25 will develop disease)';
    }
    else if(totalScore>=12 && totalScore<=14) {
      diabetesRisk = 'Moderate (estimated 1 in 6 will develop disease)';
    }
    else if(totalScore>=15 && totalScore<=20) {
      diabetesRisk = 'High (estimated 1 in 3 will develop disease)';
    }
    else {
      diabetesRisk = 'Very high (estimated 1 in 2 will develop disease)';
    }

    return showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Result",style: TextStyle(color: Colors.white),),
        scrollable: true,
        content: Center(
          child: Column(
            children: [
              Text("Your diabetes score is: $totalScore",style: TextStyle(color: Colors.white),),
              SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: 100,
                        showLabels: false,
                        showTicks: false,
                        startAngle: 270,
                        endAngle: 270,
                        radiusFactor: 0.8,
                        axisLineStyle: AxisLineStyle(
                          thickness: 1,
                          color: Colors.amberAccent,
                          thicknessUnit: GaugeSizeUnit.factor,
                        ),
                        pointers: <GaugePointer>[
                          RangePointer(
                            value: double.parse('$pct'),
                            width: 0.15,
                            enableAnimation: true,
                            animationDuration: 1000,
                            color: Colors.blue[900],
                            pointerOffset: 0.1,
                            cornerStyle: CornerStyle.bothCurve,
                            animationType: AnimationType.linear,
                            sizeUnit: GaugeSizeUnit.factor,
                          )
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              positionFactor: 0.5,
                              widget: Text('$pct%',
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize:
                                      30, fontWeight: FontWeight.bold)))
                        ])
                  ]
              ),
              Text("You have $pct% risk of having diabetes within next 10 years.",style: TextStyle(color: Colors.white),),
              Text('Risk is $diabetesRisk',style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: EdgeInsets.all(5),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('What is your age?',style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(
                  hintText: "$ageValue",
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                ),
                onTap: () {
                  ageAlertDialog(context);
                },
              ),
              SizedBox(height: 10),
              Text('What is your bmi?',style: TextStyle(
                fontSize: 18,
                  color: Colors.white
              ),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(
                  hintText: "$bmiValue",
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                ),
                onTap: () {
                  bmiAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text('Gender',style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(
                  hintText: "$genderValue",
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                ),
                onTap: () {
                  genderAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text("Waist circumference measured below the ribs",style: TextStyle(fontSize: 18,
                  color: Colors.white),),

              TextField(
                showCursor: false,
                decoration: InputDecoration(
                  hintText: "$waistValue",
                  hintStyle: TextStyle(
                      color: Colors.black
                  ),
                ),
                onTap: () {
                  waistAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text("Do you usually have daily at least 30 mins of physical activity at work during leisure time?",
                style: TextStyle(fontSize: 18,color: Colors.white),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(hintText: "$activityValue",hintStyle: TextStyle(
                    color: Colors.black
                ),),
                onTap: () {
                  activityAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text("How often do you eat vegetables, fruit or berries?",style: TextStyle(fontSize: 18,color: Colors.white),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(hintText: "$foodValue",hintStyle: TextStyle(
                    color: Colors.black
                ),),
                onTap: () {
                  foodAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text("Have you ever taken medication for high blood pressure on regular basis?",style: TextStyle(fontSize: 18,color: Colors.white),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(hintText: "$medValue",hintStyle: TextStyle(
                    color: Colors.black
                ),),
                onTap: () {
                  medAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text("Have you ever been found to have high blood glucose (e.g. in a health examination, during an illness, during pregnancy)?",style: TextStyle(fontSize: 18,color: Colors.white),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(hintText: "$glucoseValue",hintStyle: TextStyle(
                    color: Colors.black
                ),),
                onTap: () {
                  glucoseAlertDialog(context);
                },
              ),
              SizedBox(height: 10,),
              Text("Have any of the members of your immediate family or relatives been diagnosed with diabetes (type 1 or type 2)?",style: TextStyle(fontSize: 18,color: Colors.white),),
              TextField(
                showCursor: false,
                decoration: InputDecoration(hintText: "$familyValue",hintStyle: TextStyle(
                    color: Colors.black
                ),),
                onTap: () {
                  familyDiabetesDialog(context);
                },
              ),
              SizedBox(height: 10,),
              // Result button
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
                ),
                child: Text("Result"),
                onPressed: () {
                  createResultDialog(context);
                },
              ),
            ],
          )
        ]
    );
  }
}
