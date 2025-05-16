import 'package:flutter/material.dart';
import 'package:helo_world/bottom.dart';
import 'package:helo_world/input_file.dart';
import 'package:helo_world/resuabledata.dart';

class Resultpage extends StatelessWidget {
  final  String bmiresult;
  final String actualbmiresultvalue;
  final String interpretation;
  Resultpage({required this.actualbmiresultvalue,required this.bmiresult,required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your Result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable(cardchild:

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(bmiresult,style: TextStyle(
                    fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.greenAccent
                  ),),
                  Text(actualbmiresultvalue,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 90),
                  ),
                  Text(interpretation)
                ],
              ),

           kcolor: Color(0xFF111328)),),
          Bottombutton(data: 'Recalculate your BMI', onpressed: Navigator.of(context).pop)
        ],
      ),
    );
  }
}
