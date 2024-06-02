import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});

  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  final cricketDls = Get.put(CricketDlsViewModel());

  @override
  void initState() {
    super.initState();
    cricketDls.calculateTargetScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Final Result",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Final Result",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: Get.height * 0.03),
              Text(
                "Team 2 needs ${cricketDls.finalResult.value} runs in ${cricketDls.overLeft} overs to win",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
