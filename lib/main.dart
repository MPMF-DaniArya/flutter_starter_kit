import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/core/config/environment_config.dart';
import 'package:flutter_starter_kit/core/config/environment_loader.dart';

void main() {
  final config = EnvironmentLoader.load();

  runApp(App(config: config));
}

class App extends StatelessWidget {
  final EnvironmentConfig config;

  const App({required this.config, super.key});

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
