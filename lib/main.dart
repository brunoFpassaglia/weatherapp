import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/main_module.dart';
import 'package:weather_app/main_widget.dart';

void main() {
  runApp(ModularApp(module: MainModule(), child: const MainWidget()));
}
