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
        fontFamily: 'Poppins',
        iconTheme: IconThemeData(
          color: Colors.deepPurple[800],
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            fontSize: 12,
            color: Colors.deepPurple[200],
            fontStyle: FontStyle.italic,
          ),
          prefixIconColor: Colors.deepPurple[800],
          iconColor: Colors.deepPurple[200],
        ),
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.deepPurple[50],
        ),
        useMaterial3: true,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 60,
            color: Colors.deepPurple[800],
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.poppins(
            color: Colors.deepPurple[800],
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
