import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var globalMessangerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ThemeHelper().changeTheme('primary');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'csevent',
          debugShowCheckedModeBanner: true,
          initialRoute: '/login',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
