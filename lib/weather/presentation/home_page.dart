import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/weather/presentation/bloc/weather_event.dart';
import 'package:weather_app/weather/presentation/bloc/weather_state.dart';
import 'package:weather_app/weather/presentation/widget/weather_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = WeatherBloc()..add(GetLocalWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Weather App')],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            bloc: _weatherBloc,
            builder: ((context, state) {
              return switch (state) {
                (InitialWeatherState _) => const Column(children: [
                    CircularProgressIndicator(),
                  ]),
                (LoadingWeatherState _) =>
                  Center(child: const CircularProgressIndicator()),
                (SuccessWeatherState state) =>
                  WeatherWidget(weather: state.weather),
                (ErrorWeatherState state) => Column(
                    children: [Text(state.error)],
                  ),
              };
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => _weatherBloc.add(GetLocalWeatherEvent())),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
