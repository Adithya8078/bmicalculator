import 'package:flutter/material.dart';
class Appnew extends StatelessWidget {
  final IconData poda;
  final String data;
  Appnew({required this.poda,required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Icon(poda,size:100,),
        ),
          SizedBox(
            height: 15
            ,
          ),
          Text(data,style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold
          ),)]

    );
  }
}