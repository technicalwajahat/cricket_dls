import 'package:get/get.dart';

class CricketDlsViewModel extends GetxController {
  var format = 'Choose Format'.obs;
  var overs = 'Select Overs'.obs;

  var formatList = <String>['Choose Format', 'ODI', 'T20'].obs;

  void onChangedFormat(String? value) {
    if (value != null) {
      format.value = value;
    }
  }

  void onChangedOvers(String? value) {
    if (value != null) {
      overs.value = value;
    }
  }
}
