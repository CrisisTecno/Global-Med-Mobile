import 'package:flutter/material.dart';
import 'package:global_med/pages/loginScreen/loginScreen.page.dart';
import 'package:global_med/pages/pages.dart';

class RouteManager {
  static const String splashsScreen = "/splash";
  static const String homeScreen = "/home";
  static const String loginScreen = "/login";
  static const String createScreen = "/create";
  static const String onbordingScreen1 = "/onbording1";
  static const String onbordingScreen2 = "/onbording2";
  static const String onbordingScreen3 = "/onbording3";
  static const String doctorScreen = "/doctors";
  static const String citaScreen = "/cita";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashsScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case createScreen:
        return MaterialPageRoute(builder: (context) => CreateAccountScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case onbordingScreen1:
        return MaterialPageRoute(builder: (context) => Onbording1Screen());
      case onbordingScreen2:
        return MaterialPageRoute(builder: (context) => Onbording2Screen());
      case onbordingScreen3:
        return MaterialPageRoute(builder: (context) => Onbording3Screen());
      case doctorScreen:
        return MaterialPageRoute(builder: (context) => DoctorScreen());
      case citaScreen:
        return MaterialPageRoute(builder: (context) => CitaScreen());

      default:
        return MaterialPageRoute(builder: (context) => DefaultScreen());
    }
  }
}
