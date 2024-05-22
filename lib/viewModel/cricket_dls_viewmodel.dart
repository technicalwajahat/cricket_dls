import 'package:get/get.dart';

class CricketDlsViewModel extends GetxController {
  var format = 'Select Format of Match'.obs;
  var overs = 'Select Overs'.obs;

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
