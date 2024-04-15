import 'package:flutter/material.dart';
import 'package:flutter_my_utils/screen/fileio_demo.dart';
import 'package:flutter_my_utils/screen/fileio_screen.dart';
import 'package:flutter_my_utils/screen/main_screen.dart';
import 'package:flutter_my_utils/screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class RoutePath {
  // static const String home = '/home';
  static const String main = '/';
  static const String splash = '/splash';
  static const String fileio = '/fileio';
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RoutePath.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RoutePath.main,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: RoutePath.fileio,
      name: 'fileio',
      builder: (context, state) => FilePickerDemo(),
    ),
  ],
  initialLocation: '/splash',
);
