import 'package:flutter/material.dart';
import 'package:vet_app/core/env/env.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetApp',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('VetApp')),
        body: const Center(
          child: Text(
            'Flavor: ${Env.flavor}\nBase URL: ${Env.baseUrl}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
