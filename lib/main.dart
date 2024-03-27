import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/auth_service.dart';
import 'package:csevent/service/cash_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var globalMessangerKey = GlobalKey<ScaffoldMessengerState>();

void setupLocator() {
  GetIt.I.registerLazySingleton(() => AuthService());
  GetIt.I.registerLazySingleton(() => CashService());
}

void main() {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ThemeHelper().changeTheme('primary');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {


  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'csevent',
          debugShowCheckedModeBanner: false,
          initialRoute: '/login',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
