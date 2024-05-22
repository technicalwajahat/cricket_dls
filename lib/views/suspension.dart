import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class Suspension extends StatefulWidget {
  const Suspension({super.key});

  @override
  State<Suspension> createState() => _SuspensionState();
}

class _SuspensionState extends State<Suspension> {
  final cricketDls = Get.put(CricketDlsViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Suspension",
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
              const Text("Add/Edit Suspension",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: Get.height * 0.03),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Runs Before Suspension',
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Overs Left Before Suspension',
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Wickets Lost Before Suspension',
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
                  Get.toNamed("/finalResult");
                },
                child: const Text(
                  "Final Result",
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
