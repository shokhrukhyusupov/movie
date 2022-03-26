class AuthEvent {
  const AuthEvent();
}

class AuthLoginChangeEvent extends AuthEvent {
  final String login;

  AuthLoginChangeEvent(this.login);
}

class AuthPasswordChangeEvent extends AuthEvent {
  final String password;

  AuthPasswordChangeEvent(this.password);
}

class AuthConfirmPasswordChangeEvent extends AuthEvent {
  final String confirmPassword;

  AuthConfirmPasswordChangeEvent(this.confirmPassword);
}

class AuthLoginChangeTypeEvent extends AuthEvent {
  final bool isEmail;

  AuthLoginChangeTypeEvent(this.isEmail);
}

class AuthPasswordIsObscureEvent extends AuthEvent {
  final bool isObscure;

  AuthPasswordIsObscureEvent(this.isObscure);
}

class AuthButtonStatusEvent extends AuthEvent {
  final bool buttonStatus;

  AuthButtonStatusEvent(this.buttonStatus);
}

class AuthLoginSubmitEvent extends AuthEvent {}

class AuthRegisterSubmitEvent extends AuthEvent {}

class AuthGoogleLoginEvent extends AuthEvent {}

class AuthGoogleLogOutEvent extends AuthEvent {}

class AuthFacebookLoginEvent extends AuthEvent {}
