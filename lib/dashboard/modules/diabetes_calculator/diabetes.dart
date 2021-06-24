import 'package:flutter/material.dart';
import 'package:health_diary/dashboard/modules/diabetes_calculator/output.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Diabetes extends StatefulWidget {
  @override
  _DiabetesState createState() => _DiabetesState();
}

class _DiabetesState extends State<Diabetes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Assessment Tool'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[900],Colors.lightBlue,Colors.lightBlueAccent,Colors.lightBlue,Colors.blue[900]]
              )
          ),
          child: Output()
      ),
    );
  }
}
