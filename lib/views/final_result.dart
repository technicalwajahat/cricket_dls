import 'package:flutter/material.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});

  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
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
    );
  }
}
