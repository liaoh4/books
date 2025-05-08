import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import 'firebase_auth_repository.dart'; 

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuthRepository _authRepository;
  late final StreamSubscription<User?> _userSubscription;

  AuthenticationBloc(this._authRepository) : super(AuthenticationUnknown()) {
    on<AuthenticationCheckEvent>((event, emit) {
      final user = _authRepository.currentUser;
      if (user != null) {
        emit(AuthenticationAuthenticated(user.uid));
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<AuthenticationLogoutEvent>((event, emit) async {
      await _authRepository.signOut();
      emit(AuthenticationUnauthenticated());
    });

    _userSubscription = _authRepository.user.listen((user) {
      add(AuthenticationCheckEvent());
    });
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
