import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_my_utils/go_router/go_router_config.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => context.go(RoutePath.main));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          // title: const Text("Splash Screen"),
          ),
      body: const Center(
        // child: Text("Splash Screen"),
        child: Image(image: AssetImage('assets/images/water_one_drop.gif')),
      ),
    );
    // return const Center(
    //   // child: Text("Splash Screen"),
    //   child: Image(image: AssetImage('assets/images/water_splash.gif')),
    // );
  }
}
