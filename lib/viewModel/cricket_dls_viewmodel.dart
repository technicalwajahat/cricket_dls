import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CricketDlsViewModel extends GetxController {
  var format = 'Choose Format'.obs;
  var totalWickets = 10.obs;
  var finalResult = 0.0.obs;
  final totalOvers = TextEditingController();
  final targetScore = TextEditingController();
  final currentScore = TextEditingController();
  final currentOvers = TextEditingController();
  final currentWickets = TextEditingController();

  var formatList = <String>['Choose Format', 'ODI', 'T20'].obs;

  void onChangedFormat(String? value) {
    if (value != null) {
      format.value = value;
    }
  }

  void calculateResult() {
    double resourcesUsedByTeam2 = (int.parse(currentOvers.text) /
            int.parse(totalOvers.text)) +
        (int.parse(currentWickets.text) / int.parse(totalWickets.toString()));

    double resourcesAvailableToTeam1 = 1.0 - resourcesUsedByTeam2;

    final double targetScoreValue = double.parse(targetScore.text);

    finalResult.value =
        (targetScoreValue * resourcesUsedByTeam2) / resourcesAvailableToTeam1;
  }
}
