import 'package:csevent/screens/create_organization_screen.dart';
import 'package:csevent/screens/dashboard/profile/edit_profile_screen.dart';
import 'package:csevent/screens/dashboard/profile/organizations_profile_screen.dart';
import 'package:csevent/screens/dashboard/screens/dashboard.dart';
import 'package:csevent/screens/dashboard/screens/events/add_member_to_event_screen.dart';
import 'package:csevent/screens/dashboard/screens/events/add_new_event_screen.dart';
import 'package:csevent/screens/dashboard/screens/events/edit_event_screen.dart';
import 'package:csevent/screens/dashboard/screens/events/event_details_screen.dart';
import 'package:csevent/screens/dashboard/screens/events/event_members_screen.dart';
import 'package:csevent/screens/dashboard/screens/products/add_product_screen.dart';
import 'package:csevent/screens/dashboard/screens/products/filter_products_screen.dart';
import 'package:csevent/screens/dashboard/screens/products/warehouses_with_product.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/add_new_warehouse_screen.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/add_product_to_warehouse_screen.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/edit_product_in_warehouse_screen.dart';
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

  static const String addNewWarehouse = '/dashboard/warehouses/add-new';

  static const String addNewEvent = '/dashboard/events/add-new';

  static const String eventDetails = '/dashboard/events/details';

  static const String editEvent = '/dashboard/events/details/edit';

  static const String eventMembers = '/dashboard/events/details/members';

  static const String addNewMemberToEvent =
      '/dashboard/events/details/members/new';

  static const String addNewProduct = '/dashboard/products/add-new';

  static const String filterProducts = '/dashboard/products/filter';

  static const String warehousesWithProduct = '/dashboard/products/warehouses';

  static const String profile = '/profile';

  static const String editProfile = '/profile/edit';

  static const String organizationsProfile = '/profile/organizations';

  static const String warehouseDetails = '/dashboard/warehouse/details';

  static const String addProductToWarehouse =
      '/dashboard/warehouse/details/add-new';

  static const String editProductInWarehouse =
      '/dashboard/warehouse/details/edit';

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
        return MaterialPageRoute(builder: (_) => const Dashboard());

      case addNewWarehouse:
        return MaterialPageRoute(builder: (_) => AddNewWarehouseScreen());

      case addNewEvent:
        return MaterialPageRoute(builder: (_) => const AddNewEventScreen());

      case addNewProduct:
        return MaterialPageRoute(builder: (_) => const AddProductScreen());

      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());

      case organizationsProfile:
        return MaterialPageRoute(
            builder: (_) => const OrganizationsProfileScreen());

      case warehouseDetails:
        return MaterialPageRoute(
            builder: (_) =>
                WarehouseDetailsScreen(warehouseId: args as String));

      case addProductToWarehouse:
        return MaterialPageRoute(
            builder: (_) => const AddProductToWarehouseScreen());

      case editProductInWarehouse:
        return MaterialPageRoute(
            builder: (_) =>
                EditProductInWarehouse(warehouseId: args as String));

      case filterProducts:
        return MaterialPageRoute(builder: (_) => const FilterProductsScreen());

      case warehousesWithProduct:
        return MaterialPageRoute(
            builder: (_) => WarehousesWithProduct(productId: args as String));

      case eventDetails:
        return MaterialPageRoute(
            builder: (_) => EventDetailsScreen(eventId: args as String));

      case editEvent:
        return MaterialPageRoute(builder: (_) => const EditEventScreen());

      case eventMembers:
        return MaterialPageRoute(builder: (_) => const EventMembersScreen());

      case addNewMemberToEvent:
        return MaterialPageRoute(
            builder: (_) => const AddMemberToEventScreen());

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
