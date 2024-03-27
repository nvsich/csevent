import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/auth_service.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var globalMessangerKey = GlobalKey<ScaffoldMessengerState>();

void setupLocator() {
  GetIt.I.registerLazySingleton(() => AuthService());
  GetIt.I.registerLazySingleton(() => CacheService());
}

void main() {
  setupLocator();

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  ThemeHelper().changeTheme('primary');

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final CacheService cacheService = GetIt.I<CacheService>();
  static const noToken = "Пожалуйста, войдите заново!";

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return FutureBuilder<String>(
          future: cacheService.loadAuthToken(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final initialRoute = snapshot.data == noToken ? RouteGenerator.loginScreen : RouteGenerator.dashboard;
              return MaterialApp(
                theme: theme,
                title: 'csevent',
                debugShowCheckedModeBanner: false,
                initialRoute: initialRoute,
                onGenerateRoute: RouteGenerator.generateRoute,
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }
}
