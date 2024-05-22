import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class DetailsTeamOne extends StatefulWidget {
  const DetailsTeamOne({super.key});

  @override
  State<DetailsTeamOne> createState() => _DetailsTeamOneState();
}

class _DetailsTeamOneState extends State<DetailsTeamOne> {
  final cricketDls = Get.put(CricketDlsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details for Team 1",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Details for Team 1",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: Get.height * 0.03),
              DropdownButtonFormField<String>(
                autofocus: false,
                value: cricketDls.overs.value,
                isExpanded: true,
                onChanged: cricketDls.onChangedOvers,
                items: <String>[
                  'Select Overs',
                  '50',
                  '20',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == "Select Overs") {
                    return ("Please Select Overs");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                  hintText: "Team One",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              FilledButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Get.toNamed("/teamTwo");
                },
                child: const Text(
                  "Next",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
