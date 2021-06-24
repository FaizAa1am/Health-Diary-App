
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_diary/dashboard/dashboard_drawer.dart';
import 'package:health_diary/dashboard/modules/covid/covid.dart';
import 'package:health_diary/dashboard/modules/depression_calculator/depression.dart';
import 'package:health_diary/dashboard/modules/diabetes_calculator/diabetes.dart';
import '../dashboard/dashboard_drawer.dart';

class Dashboard extends StatelessWidget {
  var name='Faiz';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.lightBlueAccent,
      ),
     drawer: DashboardDrawer(),
      body: ListView(
        padding: EdgeInsets.all(5.0),
        children: [
          Container(
          padding: EdgeInsets.only(top: 30,left: 10,right: 10),
          color: Colors.white,
          child: Column(
            children: [
              Text("Welcome $name",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 30,
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:2,
                            child: Container(
                              padding: EdgeInsets.only(left: 10,top: 20),
                              child: Text(
                                "Not a better healthcare, but a better "
                                    "healthcare experience",style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // Expanded(
                          //     child: Image(
                          //       image: AssetImage('assets/images/hp.jpg'),
                          //     ),
                          //   )
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 15,right: 20),
                              child: CircleAvatar(
                                  radius: 62,
                                  backgroundImage: AssetImage('assets/images/hp.jpg'),
                                ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.lightBlue,
                              backgroundColor: Colors.amberAccent
                            ),
                            onPressed: () {},
                            child: Text("Predict Disease",style: TextStyle(
                              fontSize: 18
                            ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),

            //  Heart Rate Box
              SizedBox(height: 15),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 30,
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Container(
                              padding: EdgeInsets.only(left: 10,top: 20),
                              child: Text(
                                "Checkout the risk of getting diabetes",style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 30,left: 35),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage: AssetImage('assets/images/hr.jpg'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.lightBlue,
                              backgroundColor: Colors.amberAccent
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => Diabetes())
                              );
                            },
                            child: Text("Diabetes Risk",style: TextStyle(
                                fontSize: 18
                            ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),


            //  BMI Box
              SizedBox(height: 15),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 30,
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Container(
                              padding: EdgeInsets.only(left: 10,top: 20),
                              child: Text(
                                "Your stomach shouldn’t be a waist basket.",style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 30,left: 35),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage: AssetImage('assets/images/bmi.jpg'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.lightBlue,
                              backgroundColor: Colors.amberAccent
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed('/dashboard/bmi_calculator');
                            },
                            child: Text("Check BMI",style: TextStyle(
                                fontSize: 18
                            ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),


              // Nutrition Box
              SizedBox(height: 15),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 30,
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Container(
                              padding: EdgeInsets.only(left: 10,top: 20),
                              child: Text(
                                "Measure the risk of getting the Covid-19",style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 30,left: 35),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage: AssetImage('assets/images/covid.jpg'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.lightBlue,
                              backgroundColor: Colors.amberAccent
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Covid(name: name,))
                              );
                            },
                            child: Text("Covid Risk",style: TextStyle(
                                fontSize: 18
                            ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  elevation: 30,
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Container(
                              padding: EdgeInsets.only(left: 10,top: 20),
                              child: Text(
                                "Find out how much depressed you are",style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 30,left: 35),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundImage: AssetImage('assets/images/diet.jpg'),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.lightBlue,
                              backgroundColor: Colors.amberAccent
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => DepressionCalculator())
                              );
                            },
                            child: Text("Calculate Depression",style: TextStyle(
                                fontSize: 18
                            ),)
                        ),
                      )
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
        ]
      ),
    );
  }
}