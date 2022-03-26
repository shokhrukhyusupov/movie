import 'package:movie/bloc/auth_bloc/auth_status.dart';
import 'package:movie/utils/validators.dart';

class AuthState {
  final String login;
  final String password;
  final String confirmPassword;
  final bool isEmail;
  final bool isObscure;
  final bool buttonStatus;
  final AuthStatus status;

  bool get validateEmail => Validators.isValidEmail(login);

  bool get validatePhoneNumber => Validators.isValidPhoneNumber(login);

  bool get validatePassword => Validators.isValidPassword(password);

  get validateConfirmPassword => password == confirmPassword;

  AuthState({
    this.login = '',
    this.password = '',
    this.confirmPassword = '',
    this.isEmail = true,
    this.isObscure = true,
    this.buttonStatus = true,
    this.status = const AuthInitialStatus(),
  });

  AuthState copyWith({
    String? login,
    String? password,
    String? confirmPassword,
    bool? isEmail,
    bool? isObscure,
    bool? buttonStatus,
    AuthStatus? status,
  }) {
    return AuthState(
      login: login ?? this.login,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      isEmail: isEmail ?? this.isEmail,
      isObscure: isObscure ?? this.isObscure,
      buttonStatus: buttonStatus ?? this.buttonStatus,
      status: status ?? this.status,
    );
  }
}
