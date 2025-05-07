import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'pages/byauthor.dart';
import 'pages/bytitledetail.dart';
import 'pages/bytitle.dart';
import 'pages/byauthordetail.dart';
import 'pages/profile.dart';
import 'pages/login.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();     // 用于 /login 和 /detail 这些非 shell 页面
final _shellNavigatorKey = GlobalKey<NavigatorState>();    // 用于主 tab 页嵌套

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/byAuthor',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final location = state.uri.toString();
        String title;
        if (location.startsWith('/profile')) {
         title = 'Profile';
        } else {
           title = 'Books'; // default
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
      parentNavigatorKey: _rootNavigatorKey, // 跳出 Shell
      builder: (context, state) => const ByAuthorDetail(),
    ),
    GoRoute(
      path: '/byTitleDetail',
      name: 'byTitleDetail',
      parentNavigatorKey: _rootNavigatorKey, // 跳出 Shell
      builder: (context, state) => const ByTitleDetail(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      parentNavigatorKey: _rootNavigatorKey, // 跳出 Shell
      builder: (context, state) => const Login(),
    ),
  ],
);
int _getIndex(String location) {
  if (location.startsWith('/byTitle')) return 1;
  if (location.startsWith('/profile')) return 2;
  return 0;
}

