import 'package:flutter/material.dart';

class HospitalView extends StatelessWidget {
  const HospitalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hospital')),
      body: const Center(child: Text('Hospitalización (placeholder)')),
    );
  }
}
