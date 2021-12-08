import 'dart:math';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class BMICalculator {
  BMICalculator({
    required this.height,
    required this.weight,
    required this.gender,
    this.age,
  });

  final int? age;
  final int height;
  final int weight;
  final String gender;
  double _bmi = 0;

  String bmiCalculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBMIText() {
    if (gender == kFemale) {
      if (_bmi >= 25) {
        return 'Übergewicht > 25';
      } else if (_bmi >= 19) {
        return 'Normal 19 - 24';
      } else {
        return 'Untergewicht < 19';
      }
    } else {
      if (_bmi >= 26) {
        return 'Übergewicht > 26';
      } else if (_bmi >= 20) {
        return 'Normal 20 - 25';
      } else {
        return 'Untergewicht < 20';
      }
    }
  }

  Color getBMIColor() {
    if (gender == kFemale) {
      if (_bmi >= 25) {
        return kOverweightColor;
      } else if (_bmi >= 19) {
        return kNormalweightColor;
      } else {
        return kUnderweightColor;
      }

    } else {
      if (_bmi >= 26) {
        return kOverweightColor;
      } else if (_bmi >= 20) {
        return kNormalweightColor;
      } else{
        return kUnderweightColor;
      }
    }
  }
}
