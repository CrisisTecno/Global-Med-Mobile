import 'dart:async';

import 'package:flutter/material.dart';
import 'package:global_med/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  double _scale = 1.0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(RouteManager.homeScreen);
    });

    _controller =AnimationController(vsync: this,duration: Duration(seconds: 1),);

    Timer(Duration(seconds: 2),(){
      setState(() {
        _scale=1.5;
      });
      _controller.forward();
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
          color: Color(0xFF027A8B),
          child: Center(
            child: Image.asset("public/images/globalmed.logo.png"),
          ),
        ),
      ),
    );
  }
}
