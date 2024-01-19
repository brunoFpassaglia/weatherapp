import 'package:flutter/material.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = WeatherBloc();
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
          children: [
            Text('data'),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
