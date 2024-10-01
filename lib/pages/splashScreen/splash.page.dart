import 'dart:async';

import 'package:flutter/material.dart';
import 'package:global_med/themes/themes.dart';
import 'package:global_med/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _height = 150.h;
  double _width = 250.h;

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(RouteManager.onbordingScreen1);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: secondary,
          child: Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Image.asset(
                "public/images/logos/globalmed.logo.png",
                height: _height,
                width: _width,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
