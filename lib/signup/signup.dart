import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final auth = FirebaseAuth.instance;
  String name,phone,email,password,error;
  @override
  Widget build(BuildContext context) {
    PageController pagecontroller = PageController(initialPage: 0);
    int pageChanged = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Sign Up"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Builder(builder: (context) {
        return ListView(
            padding: EdgeInsets.all(10),
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Create Account",style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(height: 30),
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: "Name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          labelStyle: TextStyle(
                              fontSize: 18
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          labelText: 'Phone',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          labelStyle: TextStyle(
                              fontSize: 18
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          phone = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          labelStyle: TextStyle(
                              fontSize: 18
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextField(
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          labelStyle: TextStyle(
                              fontSize: 18
                          )
                      ),
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sign Up",
                          style: TextStyle(
                            fontSize: 22,
                          ),),
                        FloatingActionButton(
                          onPressed: () async{
                            try {
                              CollectionReference collectionReference = FirebaseFirestore.instance.collection('users');
                              final existingUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                              ).then((signedInUser) {
                              // String uid = auth.currentUser.uid.toString();
                              FirebaseFirestore.instance.collection('users').add({
                              'Name': name,
                              'Phone no.': phone,
                              'Email': email,
                              'Password': password
                              }).then((value) {
                                print("Signed In user = ${signedInUser}");
                              SnackBar mysnackbar = SnackBar(
                                content: Text("Sign up successful."),
                                backgroundColor: Colors.green,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
                              Navigator.of(context).pop();
                              });
                              });
                            } catch (e) {
                              print("The current exception is: ${e}");
                              SnackBar mysnackbar = SnackBar(
                                content: Text("Sign up failed!"),
                                backgroundColor: Colors.red,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(mysnackbar);
                            }
                          },
                          backgroundColor: Colors.lightBlueAccent,
                          child: Icon(Icons.arrow_forward,color: Colors.white,),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Already have an account ",style: TextStyle(
                            fontSize: 18
                        ),),
                        InkWell(
                          child: Text("Sign In",style:
                          TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 2
                          ),),
                          onTap: () {
                            Navigator.of(context).pop();
                          },

                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]
        );
      }),
    );
  }
}
