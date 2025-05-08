import 'package:books/authentication/authentication_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'authentication/authentication_bloc.dart';
import 'authentication/firebase_auth_repository.dart';
import 'router.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = FirebaseAuthRepository();
    final authBloc = AuthenticationBloc(authRepository);
    final router = createRouter(authBloc); 

    return RepositoryProvider<FirebaseAuthRepository>.value(
      value: authRepository,
      child: BlocProvider<AuthenticationBloc>.value(
        value: authBloc..add(AuthenticationCheckEvent()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
