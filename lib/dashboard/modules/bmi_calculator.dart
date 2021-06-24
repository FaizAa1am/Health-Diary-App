import 'dart:ui';
// import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class BmiCalculator extends StatefulWidget {
  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  double height;
  double weight;
  double result;
  String finalResult;
  void _calculateBMI() {
    if(heightController.text.isEmpty || weightController.text.isEmpty) {
      print("Fill the fields first!");
      return;
    }
    setState(() {
      height =double.parse(heightController.text)/100;
      weight =double.parse(weightController.text);
      result = weight/(height*height);
      if(result<16.0) {
        finalResult = "Very Severely Underweight";
      } else if(result >= 16.0 && result <= 16.9) {
        finalResult = "Severely Underweight";
      } else if(result >= 17.0 && result <= 18.4) {
        finalResult = "Underweight";
      } else if(result >= 18.5 && result <= 24.9) {
        finalResult = "Normal";
      } else if(result >= 25.0 && result <= 29.9) {
        finalResult = "Overweight";
      } else if(result >= 30.0 && result <= 34.9) {
        finalResult = "Severely Overweight";
      } else {
        finalResult = "Very Severely Overweight";
      }
    });
  }
  void _resetValues() {
    setState(() {
      heightController.text = "";
      weightController.text = "";
      result = null;
    });
  }
  void _hideBar() {
    setState(() {
      result = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
          backgroundColor: Colors.blueAccent,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [Colors.red, Colors.redAccent],
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetValues,
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.lightBlue,Colors.lightBlue,Colors.blueAccent,Colors.lightBlueAccent]
              )
          ),
          // margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          child: Column(children: [
            TextField(
                controller: heightController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onTap: _hideBar,
                decoration: InputDecoration(
                  labelText: "Height",
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Centimetres",
                  hintStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                )
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
                controller: weightController,
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                onTap: _hideBar,
                decoration: InputDecoration(
                    labelText: "Weight",
                    labelStyle: TextStyle(
                        color:Colors.white,
                        fontSize:24,
                        fontWeight: FontWeight.bold
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "Kg",
                  hintStyle: TextStyle(color: Colors.white)
                )
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.amberAccent,
              child: Text("Calculate BMI",
                style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 18
                ),),
              onPressed: _calculateBMI,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                result != null ?
                "BMI : ${result.toStringAsFixed(2) }, You are ${finalResult}" : "",
                style: TextStyle(
                    fontSize:22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: ""
                ),
              ),
            ),
            if (result!=null) Expanded(
              child: Container(
                child: SfRadialGauge(
                  axes: [
                    RadialAxis(
                      startAngle: 180,
                      endAngle: 360,
                      radiusFactor: 0.9,
                      canScaleToFit: true,
                      showAxisLine: true,
                      showLabels: true,
                      interval: 20,
                      minimum: 0,
                      maximum: 40,
                      labelsPosition: ElementsPosition.outside,
                      axisLineStyle: AxisLineStyle(
                        thickness: 10,
                      ),
                      axisLabelStyle: GaugeTextStyle(
                        fontSize: 18,
                        color: Colors.white
                      ),
                      pointers: [
                        MarkerPointer(
                            value: result,
                            markerWidth:20,
                            markerHeight:20,
                            color: result >= 18.5 && result <= 24.9 ? Colors.deepOrange:
                            result <= 16.0 ? Colors.lightGreenAccent:Colors.pink,
                            markerType: MarkerType.invertedTriangle,
                            markerOffset: -14
                        )
                      ],
                      annotations: [
                        GaugeAnnotation(
                            angle: 175,
                            positionFactor: 0.8,
                            verticalAlignment: GaugeAlignment.near,
                            widget: Container(
                              child: Text("Underweight",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                            )
                        ),
                        GaugeAnnotation(
                            angle: 270,
                            positionFactor: 0.1,
                            widget: Container(
                              child: Text("${result.toStringAsFixed(2)}",
                                  style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                            )
                        ),
                        GaugeAnnotation(
                            angle: 5,
                            positionFactor: 0.8,
                            verticalAlignment: GaugeAlignment.near,
                            widget: Container(
                                child:Text("Overweight",
                                    style:TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    )
                                )
                            )
                        ),
                      ],
                      ranges: [
                        GaugeRange(
                          startValue: 0,
                          endValue: 40,
                          // label: "50",
                          labelStyle: GaugeTextStyle(fontSize: 20),
                          sizeUnit: GaugeSizeUnit.factor,
                          gradient: SweepGradient(
                              colors:[Colors.lightGreenAccent,Colors.deepOrange,Colors.pink],
                              stops: [0.01,0.5,0.9]
                          ),
                          startWidth: 0.4,
                          endWidth: 0.4,
                        )
                      ],
                      showTicks: false,
                    )
                  ],
                ),
              ),
            ) else Text(""),
          ],
          ),
        )
    );
  }
}
