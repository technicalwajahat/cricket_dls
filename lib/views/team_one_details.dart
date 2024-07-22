import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class DetailsTeamOne extends StatefulWidget {
  const DetailsTeamOne({super.key});

  @override
  State<DetailsTeamOne> createState() => _DetailsTeamOneState();
}

class _DetailsTeamOneState extends State<DetailsTeamOne> {
  final cricketDls = Get.put(CricketDlsViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Team A",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Team A Score",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: Get.height * 0.03),
                TextFormField(
                  autofocus: false,
                  enabled: false,
                  controller: cricketDls.totalOvers,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Overs",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                TextFormField(
                  autofocus: false,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.done,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Target";
                    }
                    if (int.tryParse(value) != null &&
                        int.parse(value) >= 550) {
                      return "Score must be less than 550";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cricketDls.targetScore.text = value!;
                  },
                  controller: cricketDls.targetScore,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Target',
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
                    if (_formKey.currentState!.validate()) {
                      Get.toNamed("/teamOnePlayer");
                    }
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
      ),
    );
  }
}
