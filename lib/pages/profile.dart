import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../authentication/authentication_bloc.dart';
import '../authentication/authentication_event.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: SizedBox(
        width: 150,
        child: FilledButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(AuthenticationLogoutEvent());
          },
          style: FilledButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 170, 131, 182),
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.white),
          ),
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
