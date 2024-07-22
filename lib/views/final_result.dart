import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});

  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  final cricketDls = Get.put(CricketDlsViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Final Result",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  autofocus: false,
                  enabled: true,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Current Score";
                    }
                    if (int.tryParse(value) != null &&
                        int.parse(value) >
                            int.parse(cricketDls.targetScore.text)) {
                      return "Score must be less than ${cricketDls.targetScore.text}";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cricketDls.currentScore.text = value!;
                  },
                  controller: cricketDls.currentScore,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Team B Current Score',
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
                      return "Please Enter Remaining Resources";
                    }
                    if (int.tryParse(value) != null && int.parse(value) > 100) {
                      return "Score must be less than 100";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cricketDls.resourceRemaining.text = value!;
                  },
                  controller: cricketDls.resourceRemaining,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Remaining Resources',
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
                      cricketDls.calculateResult();
                    }
                  },
                  child: const Text(
                    "Calculate Result",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                Obx(
                  () => Text(
                    "Projected Score : ${cricketDls.projectedScore.value.toStringAsFixed(0)}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700),
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
