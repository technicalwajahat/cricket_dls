import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class DetailsTeamTwo extends StatefulWidget {
  const DetailsTeamTwo({super.key});

  @override
  State<DetailsTeamTwo> createState() => _DetailsTeamTwoState();
}

class _DetailsTeamTwoState extends State<DetailsTeamTwo> {
  final cricketDls = Get.put(CricketDlsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Details for Team 2",
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
              const Text("Details for Team 2",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: Get.height * 0.03),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Overs',
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
                  Get.toNamed("/suspension");
                },
                child: const Text(
                  "Add/Edit Suspension Team 2",
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
