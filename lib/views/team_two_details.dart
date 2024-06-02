import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../viewModel/cricket_dls_viewmodel.dart';

class DetailsTeamTwo extends StatefulWidget {
  const DetailsTeamTwo({super.key});

  @override
  State<DetailsTeamTwo> createState() => _DetailsTeamTwoState();
}

class _DetailsTeamTwoState extends State<DetailsTeamTwo> {
  final cricketDls = Get.put(CricketDlsViewModel());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Team 2",
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
                const Text("Details for Team 2",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: Get.height * 0.03),
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
                    if (int.parse(value) >=
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
                    hintText: "Current Score",
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
                      return "Please Enter Current Overs";
                    }
                    if (int.tryParse(value) != null &&
                        int.parse(value) >=
                            int.parse(cricketDls.totalOvers.text)) {
                      return "Overs must be less than ${cricketDls.totalOvers.text}";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cricketDls.currentOvers.text = value!;
                  },
                  controller: cricketDls.currentOvers,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Current Over",
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
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(50),
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Lost Wickets";
                    }
                    if (int.tryParse(value) != null &&
                        int.parse(value) >
                            int.parse(
                                cricketDls.totalWickets.value.toString())) {
                      return "Wickets les than or equal to 10";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    cricketDls.currentWickets.text = value!;
                  },
                  controller: cricketDls.currentWickets,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Wicket Lost",
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
