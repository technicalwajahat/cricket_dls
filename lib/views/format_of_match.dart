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
          "Match Format",
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
              Obx(() => DropdownButtonFormField<String>(
                    icon: const Icon(Icons.arrow_drop_down),
                    value: cricketDls.format.value,
                    items: cricketDls.formatList.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (item) {
                      cricketDls.format.value = item!;
                    },
                  )),
              SizedBox(height: Get.height * 0.03),
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
