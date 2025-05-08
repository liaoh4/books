abstract class AuthenticationState {}

class AuthenticationUnknown extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  final String uid;
  AuthenticationAuthenticated(this.uid);
}

class AuthenticationUnauthenticated extends AuthenticationState {}
