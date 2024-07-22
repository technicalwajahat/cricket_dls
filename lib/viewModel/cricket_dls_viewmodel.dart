import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CricketDlsViewModel extends GetxController {
  var format = 'Choose Format'.obs;

  final totalOvers = TextEditingController();
  final targetScore = TextEditingController();
  final currentScore = TextEditingController();
  final resourceRemaining = TextEditingController();
  final typicalScore = 160.0.obs;
  final projectedScore = 0.0.obs;

  var formatList = <String>['Choose Format', 'ODI', 'T20'].obs;

  var screen1Values = List.generate(11, (_) => List.filled(3, '')).obs;
  var screen2Values = List.generate(6, (_) => List.filled(3, '')).obs;

  void updateValue(
      int screenIndex, int rowIndex, int fieldIndex, String value) {
    if (screenIndex == 1) {
      screen1Values[rowIndex][fieldIndex] = value;
    } else if (screenIndex == 2) {
      screen2Values[rowIndex][fieldIndex] = value;
    }
  }

  String getValue(int screenIndex, int rowIndex, int fieldIndex) {
    if (screenIndex == 1) {
      return screen1Values[rowIndex][fieldIndex];
    } else if (screenIndex == 2) {
      return screen2Values[rowIndex][fieldIndex];
    }
    return '';
  }

  void calculateResult() {
    var resource = convertResourceToDecimal();
    var result = double.parse((currentScore.text)) + (typicalScore * resource);
    projectedScore.value = result.round().toDouble();
  }

  double convertResourceToDecimal() {
    return double.parse(resourceRemaining.text) / 100;
  }
}
