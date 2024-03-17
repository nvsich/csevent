import 'package:csevent/screens/login_screen.dart';
import 'package:csevent/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // static const String signupScreen = '/signup';

  // static const String loginScreen = '/login';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('NOT IMPLEMENTED'),
        ),
      );
    });
  }
}
