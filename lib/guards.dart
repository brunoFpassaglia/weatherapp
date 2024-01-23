import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/auth/presentation/bloc/auth_bloc.dart';
import 'package:weather_app/auth/presentation/bloc/auth_state.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/login');

  @override
  Future<bool> canActivate(String path, ModularRoute route) async {
    return Modular.get<AuthBloc>().state is AuthAuthenticated;
  }
}
