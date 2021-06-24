import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../signup/signup.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Container(
          // height: (MediaQuery.of(context).size.height * 1.0) - appbar.preferredSize.height,
          color: Colors.white12,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.white60,
                child:Image.asset(
                  'assets/images/3115.png',
                  fit: BoxFit.cover,
                ),
              ),
              Text("Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                obscureText: true,
                autocorrect: false,
                enableSuggestions: false,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  icon: Icon(Icons.vpn_key),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sign in",
                    style: TextStyle(
                      fontSize: 22,
                    ),),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/dashboard');
                    },
                    backgroundColor: Colors.lightBlueAccent,
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  InkWell(
                    child: Text("Create new account",style:
                    TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationThickness: 2
                    ),),
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },

                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}