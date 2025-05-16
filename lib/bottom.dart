import 'package:flutter/material.dart';
import 'resultpage.dart';

class Bottombutton extends StatelessWidget {
  final VoidCallback onpressed;
  final String data;
  Bottombutton({required this.data,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        child: Center(
          child: Text(
            data,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ),
        width: double.infinity,
        color: Color(0xFFEA1E63),
        height: 50.0,
        margin: EdgeInsets.only(top: 15.0),
      ),
    );
  }
}