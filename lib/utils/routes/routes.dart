



import 'package:flutter/material.dart';
import 'package:global_med/pages/pages.dart';

class RouteManager{
  static const String splashsScreen="/splash";
  static const String homeScreen="/home";



  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case splashsScreen:
        return MaterialPageRoute(builder:(context)=>SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder:(context)=>HomeScreen());
      default:
        return MaterialPageRoute(builder:(context)=>DefaultScreen());
    }

  }



}