import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/auth/presentation/bloc/auth_event.dart';
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
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = Modular.get<WeatherBloc>()..add(GetLocalWeatherEvent());
    _authBloc = Modular.get<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Weather App',
        ),
        actions: [
          IconButton(
              onPressed: () => _authBloc.add(LogOut()),
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height / 10,
            left: MediaQuery.of(context).size.width / 10,
            right: MediaQuery.of(context).size.width / 10,
          ),
          child: BlocBuilder<WeatherBloc, WeatherState>(
            bloc: _weatherBloc,
            builder: ((context, state) {
              return switch (state) {
                (InitialWeatherState _) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                (LoadingWeatherState _) =>
                  Center(child: const CircularProgressIndicator()),
                (SuccessWeatherState state) => WeatherWidget(
                    weather: state.weather,
                    animation: state.animation,
                  ),
                (ErrorWeatherState state) => Center(
                    child: Text(state.error, textAlign: TextAlign.center),
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
