import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late 

  @override
  void initState() { 
    super.initState();

    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Weather App')],
        ),
      ),
      body: Center(
        child: ListView(
          children: [],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
