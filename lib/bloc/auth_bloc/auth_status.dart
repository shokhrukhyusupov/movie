import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthStatus {
  const AuthStatus();
}

class AuthInitialStatus extends AuthStatus {
  const AuthInitialStatus();
}

class AuthLoadingStatus extends AuthStatus {}

class AuthSuccessStatus extends AuthStatus {
  final User user;

  AuthSuccessStatus(this.user);
}

class AuthFailureStatus extends AuthStatus {
  final String exception;

  AuthFailureStatus(this.exception);
}