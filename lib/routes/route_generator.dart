import 'package:csevent/screens/create_organization_screen.dart';
import 'package:csevent/screens/login_screen.dart';
import 'package:csevent/screens/signin_organization_screen.dart';
import 'package:csevent/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String signupScreen = '/signup';

  static const String loginScreen = '/login';

  static const String signInOrganizationScreen = '/signin-organization';

  static const String createOrganizationScreen = '/create-organization';

  static const String dashboard = '/dashboard';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case signupScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      case signInOrganizationScreen:
        return MaterialPageRoute(builder: (_) => SignInOrganization());

      case createOrganizationScreen:
        return MaterialPageRoute(builder: (_) => CreateOrganization());

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
