import 'dart:math';

import 'package:flutter/material.dart';
class Calculator {
  Calculator({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi;

  String bmicalculator(){
    _bmi=weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getresult(){
    if(_bmi>=25){
      return "OverWeight";
    }
    else if(_bmi>=18.5){
      return "NormalWeight";
    }
    else{
      return "UnderWeight";
    }
  }
  String giveoutput(){
    if(_bmi>=25){
      return "Do More Excercise";
    }
    else if(_bmi>=18.5){
      return "Keep It Up";
    }
    else{
      return "Eat More";
    }
  }
}