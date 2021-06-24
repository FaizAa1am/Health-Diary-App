import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  final Function restart;
  Output(this.restart);
  @override
  Widget build(BuildContext context) {
    // print(sum);
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: FloatingActionButton(onPressed: restart, backgroundColor: Colors.amberAccent, child: Icon(Icons.refresh_rounded,color: Colors.lightBlue,)),
    );
  }
}
