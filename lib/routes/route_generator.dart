import 'package:csevent/presentation/dashboard/profile/create_organization_screen.dart';
import 'package:csevent/presentation/dashboard/profile/edit_profile_screen.dart';
import 'package:csevent/presentation/dashboard/profile/organizations_profile_screen.dart';
import 'package:csevent/presentation/dashboard/dashboard.dart';
import 'package:csevent/presentation/dashboard/events/add_cocktail_screen.dart';
import 'package:csevent/presentation/dashboard/events/add_ingredient_screen.dart';
import 'package:csevent/presentation/dashboard/events/add_member_to_event_screen.dart';
import 'package:csevent/presentation/dashboard/events/add_new_event_screen.dart';
import 'package:csevent/presentation/dashboard/events/cocktail_details_screen.dart';
import 'package:csevent/presentation/dashboard/events/edit_event_screen.dart';
import 'package:csevent/presentation/dashboard/events/event_bar_card_screen.dart';
import 'package:csevent/presentation/dashboard/events/event_details_screen.dart';
import 'package:csevent/presentation/dashboard/events/event_members_screen.dart';
import 'package:csevent/presentation/dashboard/events/event_shopping_screen.dart';
import 'package:csevent/presentation/dashboard/events/ingredient_info_screen.dart';
import 'package:csevent/presentation/dashboard/events/shops_with_ingredient_screen.dart';
import 'package:csevent/presentation/dashboard/events/warehouses_with_ingredient_screen.dart';
import 'package:csevent/presentation/dashboard/products/filter_products_screen.dart';
import 'package:csevent/presentation/dashboard/products/warehouses_with_product.dart';
import 'package:csevent/presentation/dashboard/warehouses/add_new_warehouse_screen.dart';
import 'package:csevent/presentation/dashboard/warehouses/add_product_to_warehouse_screen.dart';
import 'package:csevent/presentation/dashboard/warehouses/edit_product_in_warehouse_screen.dart';
import 'package:csevent/presentation/dashboard/warehouses/warehouse_details_screen.dart';
import 'package:csevent/presentation/auth/login_screen.dart';
import 'package:csevent/presentation/dashboard/profile/profile_screen.dart';
import 'package:csevent/presentation/dashboard/profile/signin_organization_screen.dart';
import 'package:csevent/presentation/auth/signup_screen.dart';
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

  static const String eventBarCard = '/dashboard/events/details/barcard';

  static const String cocktailDetails =
      '/dashboard/events/details/barcard/cocktail';

  static const String addIngredient =
      '/dashboard/events/details/barcard/cocktail/add-ingredient';

  static const String addCocktail =
      '/dashboard/events/details/barcard/add-cocktail';

  static const String ingredientInfo =
      '/dashboard/events/details/barcard/cocktail/ingredient-info';

  static const String shopsWithIngredient =
      '/dashboard/events/details/barcard/cocktail/ingredient-info/shops';

  static const String warehousesWithIngredient =
      '/dashboard/events/details/barcard/cocktail/ingredient-info/warehouses';

  static const String eventShopping = '/dashboard/events/details/shopping';

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
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );

      case signupScreen:
        return MaterialPageRoute(
          builder: (_) => SignupScreen(),
        );

      case signInOrganizationScreen:
        return MaterialPageRoute(
          builder: (_) => SignInOrganization(),
        );

      case createOrganizationScreen:
        return MaterialPageRoute(
          builder: (_) => CreateOrganization(),
        );

      case dashboard:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var organizationName = args['organizationName']!;
        return MaterialPageRoute(
          builder: (_) => Dashboard(
            organizationId: organizationId,
            organizationName: organizationName,
          ),
        );

      case addNewWarehouse:
        return MaterialPageRoute(
          builder: (_) => AddNewWarehouseScreen(
            organizationId: args as String,
          ),
        );

      case addNewEvent:
        return MaterialPageRoute(
          builder: (_) => AddNewEventScreen(
            organizationid: args as String,
          ),
        );

      case profile:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );

      case editProfile:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
        );

      case organizationsProfile:
        return MaterialPageRoute(
          builder: (_) => OrganizationsProfileScreen(),
        );

      case warehouseDetails:
        return MaterialPageRoute(
          builder: (_) => WarehouseDetailsScreen(warehouseId: args as String),
        );

      case addProductToWarehouse:
        return MaterialPageRoute(
          builder: (_) => const AddProductToWarehouseScreen(),
        );

      case editProductInWarehouse:
        return MaterialPageRoute(
          builder: (_) => EditProductInWarehouse(warehouseId: args as String),
        );

      case filterProducts:
        return MaterialPageRoute(
          builder: (_) => const FilterProductsScreen(),
        );

      case warehousesWithProduct:
        return MaterialPageRoute(
          builder: (_) => WarehousesWithProduct(productId: args as String),
        );

      case eventDetails:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var eventId = args['eventId']!;
        return MaterialPageRoute(
          builder: (_) => EventDetailsScreen(
            eventId: eventId,
            organizationId: organizationId,
          ),
        );

      case editEvent:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var eventId = args['eventId']!;
        return MaterialPageRoute(
          builder: (_) => EditEventScreen(
            eventId: eventId,
            organizationId: organizationId,
          ),
        );

      case eventMembers:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var eventId = args['eventId']!;
        return MaterialPageRoute(
          builder: (_) => EventMembersScreen(
            organizationid: organizationId,
            eventId: eventId,
          ),
        );

      case addNewMemberToEvent:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var eventId = args['eventId']!;
        return MaterialPageRoute(
          builder: (_) => AddMemberToEventScreen(
            organizationId: organizationId,
            eventId: eventId,
          ),
        );

      case eventBarCard:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var eventId = args['eventId']!;
        return MaterialPageRoute(
          builder: (_) => EventBarCardScreen(
            organizationId: organizationId,
            eventId: eventId,
          ),
        );

      case eventShopping:
        return MaterialPageRoute(
          builder: (_) => const EventShoppingScreen(),
        );

      case addCocktail:
        var organizationId = (args as Map<String, String>)['organizationId']!;
        var eventId = args['eventId']!;
        return MaterialPageRoute(
          builder: (_) => AddCocktailScreen(
            organizationId: organizationId,
            eventId: eventId,
          ),
        );

      case cocktailDetails:
        return MaterialPageRoute(
          builder: (_) => CocktailDetailsScreen(cocktailId: args as String),
        );

      case addIngredient:
        return MaterialPageRoute(
          builder: (_) => const AddIngredientScreen(),
        );

      case ingredientInfo:
        return MaterialPageRoute(
          builder: (_) => IngredientInforScreen(ingredientId: args as String),
        );

      case warehousesWithIngredient:
        return MaterialPageRoute(
          builder: (_) =>
              WarehousesWithIngredientScreen(ingredientId: args as String),
        );

      case shopsWithIngredient:
        return MaterialPageRoute(
          builder: (_) => ShopsWithIngredientScreen(
            ingredientName: args as String,
          ),
        );

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
