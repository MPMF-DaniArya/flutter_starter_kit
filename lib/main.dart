import 'package:flutter/material.dart';

void main() {
  runApp(const StarterKitApp());
}

class StarterKitApp extends StatelessWidget {
  const StarterKitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Starter Kit',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Starter Kit')),
        body: const Center(child: Text('Starter Kit Ready')),
      ),
    );
  }
}
