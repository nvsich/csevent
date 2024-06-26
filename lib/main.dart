import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/auth_service.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/cocktail_service.dart';
import 'package:csevent/service/event_service.dart';
import 'package:csevent/service/organization_service.dart';
import 'package:csevent/service/response_handler.dart';
import 'package:csevent/service/user_service.dart';
import 'package:csevent/service/warehouse_service.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var globalMessangerKey = GlobalKey<ScaffoldMessengerState>();

void setupLocator() {
  GetIt.I.registerLazySingleton(() => AuthService());
  GetIt.I.registerLazySingleton(() => CacheService());
  GetIt.I.registerLazySingleton(() => OrganizationService());
  GetIt.I.registerLazySingleton(() => ResponseHandler());
  GetIt.I.registerLazySingleton(() => WarehouseService());
  GetIt.I.registerLazySingleton(() => EventService());
  GetIt.I.registerLazySingleton(() => UserService());
  GetIt.I.registerLazySingleton(() => CocktailService());
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
              final initialRoute = snapshot.data == noToken
                  ? RouteGenerator.loginScreen
                  : RouteGenerator.profile;
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
