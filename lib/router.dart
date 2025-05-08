import 'package:books/authentication/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'authentication/authentication_bloc.dart';
import 'pages/byauthor.dart';
import 'pages/bytitledetail.dart';
import 'pages/bytitle.dart';
import 'pages/byauthordetail.dart';
import 'pages/profile.dart';
import 'pages/login.dart';

import 'authentication/gorouter_refresh_stream.dart'; // 第一步创建的监听类

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter(AuthenticationBloc authBloc) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final loggingIn = state.matchedLocation == '/login';

      if (authState is AuthenticationAuthenticated) {
        return loggingIn ? '/byAuthor' : null;
      } else {
        return loggingIn ? null : '/login';
      }
    },
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          final location = state.uri.toString();
          String title;
          if (location.startsWith('/profile')) {
            title = 'Profile';
          } else {
            title = 'Books';
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _getIndex(state.uri.toString()),
              onTap: (index) {
                switch (index) {
                  case 0:
                    context.go('/byAuthor');
                    break;
                  case 1:
                    context.go('/byTitle');
                    break;
                  case 2:
                    context.go('/profile');
                    break;
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'By Author'),
                BottomNavigationBarItem(icon: Icon(Icons.title), label: 'By Title'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Profile'),
              ],
            ),
          );
        },
        routes: [
          GoRoute(
            path: '/byAuthor',
            name: 'byAuthor',
            builder: (context, state) => const ByAuthor(),
          ),
          GoRoute(
            path: '/byTitle',
            name: 'byTitle',
            builder: (context, state) => const ByTitle(),
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const Profile(),
          ),
        ],
      ),
      GoRoute(
        path: '/byAuthordetail',
        name: 'byAuthorDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ByAuthorDetail(),
      ),
      GoRoute(
        path: '/byTitleDetail',
        name: 'byTitleDetail',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ByTitleDetail(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const Login(),
      ),
    ],
  );
}

int _getIndex(String location) {
  if (location.startsWith('/byTitle')) return 1;
  if (location.startsWith('/profile')) return 2;
  return 0;
}
