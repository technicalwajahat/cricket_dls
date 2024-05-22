import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class FormatOfMatch extends StatefulWidget {
  const FormatOfMatch({super.key});

  @override
  State<FormatOfMatch> createState() => _FormatOfMatchState();
}

class _FormatOfMatchState extends State<FormatOfMatch> {
  final cricketDls = Get.put(CricketDlsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cricket DLS",
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
              const Text("Format of Match",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: Get.height * 0.03),
              DropdownButtonFormField<String>(
                autofocus: false,
                value: cricketDls.format.value,
                isExpanded: true,
                onChanged: cricketDls.onChangedFormat,
                items: <String>[
                  'Select Format of Match',
                  'One Day International (ODI)',
                  'T20 International (T20I)',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == "Select Format of Match") {
                    return ("Please Choose a Format");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                  hintText: "Format",
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
                  Get.toNamed("/teamOne");
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
