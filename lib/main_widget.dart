import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.deepPurple[50],
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.deepPurple[50]),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
          ),
          displaySmall: GoogleFonts.poppins(
            fontSize: 12,
          ),
        ),
      ),
      routerConfig: Modular.routerConfig,
    );
  }
}
