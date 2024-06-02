import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class Suspension extends StatefulWidget {
  const Suspension({super.key});

  @override
  State<Suspension> createState() => _SuspensionState();
}

class _SuspensionState extends State<Suspension> {
  final cricketDls = Get.put(CricketDlsViewModel());
  final _formKey = GlobalKey<FormState>();

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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Add Suspension",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                      return "Please Enter Suspension Overs";
                    }
                    if (int.tryParse(value) != null &&
                        int.parse(value) >=
                            int.parse(cricketDls.totalOvers.text)) {
                      return "Overs must be less than ${cricketDls.totalOvers.text}";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cricketDls.suspensionOvers.text = value!;
                  },
                  controller: cricketDls.suspensionOvers,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Suspension Overs",
                    labelText: 'Suspension Overs',
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
                      Get.toNamed("/finalResult");
                    }
                  },
                  child: const Text(
                    "Calculate Team 2 Score",
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
