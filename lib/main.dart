import 'package:flutter/material.dart';
import 'login/login.dart';
import 'signup/signup.dart';
import 'dashboard/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dashboard/modules/bmi_calculator.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: MyHomePage(),
      routes: {
        '/signup':(_) => SignUp(),
        '/dashboard':(_) => Dashboard(),
        '/dashboard/bmi_calculator':(_) => BmiCalculator(),
      },
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  Widget build(BuildContext context) {
    final appbar = AppBar(
      toolbarHeight: 70,
      title: Text("Login"),
      backgroundColor: Colors.lightBlueAccent,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      // ),
    );
    return Scaffold(
      appBar: appbar,
      body: Login(),
    );
  }
}