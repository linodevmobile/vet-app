import 'package:flutter/material.dart';

class PatientsView extends StatelessWidget {
  const PatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pacientes')),
      body: const Center(child: Text('Pacientes (placeholder)')),
    );
  }
}
