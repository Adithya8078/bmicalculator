import 'package:flutter/material.dart';
class Reusable extends StatelessWidget {
  final Color kcolor;
  final Widget cardchild;
  Reusable ({required this.cardchild,required this.kcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kcolor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: cardchild,
      margin: EdgeInsets.all(15.0),

    );
  }
}