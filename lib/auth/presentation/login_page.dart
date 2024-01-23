import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/auth/presentation/bloc/auth_state.dart';
import 'package:weather_app/auth/presentation/widget/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc _authBloc = Modular.get<AuthBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather App',
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const LoginForm(),
          BlocBuilder<AuthBloc, AuthState>(
            bloc: _authBloc,
            builder: ((context, state) => state is AuthLoading
                ? const CircularProgressIndicator()
                : Container()),
          )
        ],
      ),
    );
  }
}
