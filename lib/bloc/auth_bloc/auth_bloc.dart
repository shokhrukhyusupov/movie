import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/bloc/auth_bloc/auth_event.dart';
import 'package:movie/bloc/auth_bloc/auth_state.dart';
import 'package:movie/bloc/auth_bloc/auth_status.dart';
import 'package:movie/repositories/user_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;
  AuthBloc(this._userRepository) : super(AuthState()) {
    on<AuthLoginChangeEvent>((event, emit) {
      emit(state.copyWith(login: event.login));
    });
    on<AuthPasswordChangeEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<AuthConfirmPasswordChangeEvent>((event, emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
    on<AuthLoginChangeTypeEvent>((event, emit) {
      emit(state.copyWith(isEmail: event.isEmail));
    });
    on<AuthPasswordIsObscureEvent>((event, emit) {
      emit(state.copyWith(isObscure: event.isObscure));
    });
    on<AuthButtonStatusEvent>((event, emit) {
      emit(state.copyWith(buttonStatus: event.buttonStatus));
    });
    on<AuthLoginSubmitEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: const AuthInitialStatus()));
        final user = await _userRepository.emailSignIn(
            email: state.login, password: state.password);
        emit(state.copyWith(status: AuthSuccessStatus(user)));
      } catch (e) {
        emit(state.copyWith(status: AuthFailureStatus(e.toString())));
        emit(state.copyWith(status: const AuthInitialStatus()));
      }
    });
    on<AuthRegisterSubmitEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: const AuthInitialStatus()));
        final user = await _userRepository.emailSignUp(
            email: state.login, password: state.password);
        emit(state.copyWith(status: AuthSuccessStatus(user)));
      } catch (e) {
        emit(state.copyWith(status: AuthFailureStatus(e.toString())));
        emit(state.copyWith(status: const AuthInitialStatus()));
      }
    });
    on<AuthGoogleLoginEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: const AuthInitialStatus()));
        final user = await _userRepository.googleSignIn();
        emit(state.copyWith(status: AuthSuccessStatus(user)));
      } catch (e) {
        emit(state.copyWith(status: AuthFailureStatus(e.toString())));
        emit(state.copyWith(status: const AuthInitialStatus()));
      }
    });
    on<AuthGoogleLogOutEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: const AuthInitialStatus()));
        // ignore: unused_local_variable
        final user = await _userRepository.signOutfromGoogle();
      } catch (e) {
        emit(state.copyWith(status: AuthFailureStatus(e.toString())));
        emit(state.copyWith(status: const AuthInitialStatus()));
      }
    });
    on<AuthFacebookLoginEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: const AuthInitialStatus()));
        final user = await _userRepository.facebookSignIn();
        emit(state.copyWith(status: AuthSuccessStatus(user)));
      } catch (e) {
        emit(state.copyWith(status: AuthFailureStatus(e.toString())));
        emit(state.copyWith(status: const AuthInitialStatus()));
      }
    });
  }
}
