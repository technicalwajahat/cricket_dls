import 'package:cricket_dls/viewModel/cricket_dls_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThreeFieldRow extends StatelessWidget {
  final int rowIndex;
  final int screenIndex;
  final String name;

  const ThreeFieldRow(
      {super.key,
      required this.rowIndex,
      required this.screenIndex,
      required this.name});

  @override
  Widget build(BuildContext context) {
    final CricketDlsViewModel cricketDlsViewModel = Get.find();

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Obx(
            () => TextField(
              autofocus: false,
              decoration: InputDecoration(
                labelText: '$name # ${rowIndex + 1}',
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                cricketDlsViewModel.updateValue(
                    screenIndex, rowIndex, 0, value);
              },
              controller: TextEditingController(
                  text: cricketDlsViewModel.getValue(screenIndex, rowIndex, 0)),
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.01),
        Expanded(
          flex: 1,
          child: Obx(
            () => TextField(
              decoration: const InputDecoration(
                labelText: 'Average',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                cricketDlsViewModel.updateValue(
                    screenIndex, rowIndex, 1, value);
              },
              controller: TextEditingController(
                  text: cricketDlsViewModel.getValue(screenIndex, rowIndex, 1)),
            ),
          ),
        ),
        SizedBox(width: Get.width * 0.01),
        Expanded(
          flex: 1,
          child: Obx(
            () => TextField(
              decoration: const InputDecoration(
                labelText: 'Strike Rate',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                cricketDlsViewModel.updateValue(
                    screenIndex, rowIndex, 2, value);
              },
              controller: TextEditingController(
                  text: cricketDlsViewModel.getValue(screenIndex, rowIndex, 2)),
            ),
          ),
        ),
      ],
    );
  }
}
