import 'package:csevent/screens/create_organization_screen.dart';
import 'package:csevent/screens/dashboard/profile/edit_profile_screen.dart';
import 'package:csevent/screens/dashboard/profile/organizations_profile_screen.dart';
import 'package:csevent/screens/dashboard/screens/dashboard.dart';
import 'package:csevent/screens/dashboard/screens/events/add_new_event_screen.dart';
import 'package:csevent/screens/dashboard/screens/products/add_product_screen.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/add_new_warehouse_screen.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/add_product_to_warehouse_screen.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/warehouse_details_screen.dart';
import 'package:csevent/screens/login_screen.dart';
import 'package:csevent/screens/dashboard/profile/profile_screen.dart';
import 'package:csevent/screens/signin_organization_screen.dart';
import 'package:csevent/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static const String signupScreen = '/signup';

  static const String loginScreen = '/login';

  static const String signInOrganizationScreen = '/signin-organization';

  static const String createOrganizationScreen = '/create-organization';

  static const String dashboard = '/dashboard';

  static const String addNewWarehouse = 'dashboard/warehouses/add-new';

  static const String addNewEvent = 'dashboard/events/add-new';

  static const String addNewProduct = 'dashboard/products/add-new';

  static const String profile = '/profile';

  static const String editProfile = '/profile/edit';

  static const String organizationsProfile = 'profile/organizations';

  static const String warehouseDetails = '/warehouse/details';

  static const String addProductToWarehouse = '/warehouse/details/add-new';

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

      case dashboard:
        return MaterialPageRoute(builder: (_) => Dashboard());

      case addNewWarehouse:
        return MaterialPageRoute(builder: (_) => AddNewWarehouseScreen());

      case addNewEvent:
        return MaterialPageRoute(builder: (_) => AddNewEventScreen());

      case addNewProduct:
        return MaterialPageRoute(builder: (_) => AddProductScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case organizationsProfile:
        return MaterialPageRoute(builder: (_) => OrganizationsProfileScreen());

      case warehouseDetails:
        return MaterialPageRoute(
            builder: (_) =>
                WarehouseDetailsScreen(warehouseId: args as String));

      case addProductToWarehouse:
        return MaterialPageRoute(builder: (_) => AddProductToWarehouseScreen());

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
