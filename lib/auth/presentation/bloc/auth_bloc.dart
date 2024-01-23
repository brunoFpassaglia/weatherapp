import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/auth/domain/usecase/login_use_case.dart';
import 'package:weather_app/auth/presentation/bloc/auth_event.dart';
import 'package:weather_app/auth/presentation/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase usecase;
  AuthBloc({
    required this.usecase,
  }) : super(AuthUninitialized()) {
    on<AppStarted>(_onAppStarted);
    on<AttemptLogin>(_onAttemptLogin);
    on<LogOut>(_onLogOut);
  }

  void _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      // await usecase.checkValidToken();
      emit(AuthAuthenticated('mock token'));
      _navigateToHome();
    } catch (e) {
      emit(AuthUnauthenticated());
      _navigateToLogin();
    }
  }

  void _onAttemptLogin(AttemptLogin event, Emitter<AuthState> emit) async {
    var jwtToken = await usecase.login(event.email, event.password);
    emit(AuthAuthenticated(jwtToken));
    _navigateToHome();
  }

  void _onLogOut(LogOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    // todo: execute logout use case
    try {
      emit(AuthUnauthenticated());
      _navigateToLogin();
    } catch (e) {
      // TODO
    }
  }

  void _navigateToHome() {
    Modular.to.navigate('/home');
  }

  void _navigateToLogin() {
    Modular.to.navigate('/login');
  }
}
