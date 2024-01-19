import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        useMaterial3: true,
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
