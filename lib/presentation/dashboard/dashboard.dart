import 'package:csevent/core/app_export.dart';
import 'package:csevent/core/utils/image_constant.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/presentation/dashboard/events/events_screen.dart';
import 'package:csevent/presentation/dashboard/members/members_screen.dart';
import 'package:csevent/presentation/dashboard/products/products_screen.dart';
import 'package:csevent/presentation/dashboard/warehouses/warehouses_screen.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/appbar_trailing_image.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
    required this.organizationId,
    required this.organizationName,
  });

  final String organizationId;

  final String organizationName;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 2;

  late List<Widget> body;

  @override
  void initState() {
    super.initState();
    body = [
      ProductsScreen(),
      WarehousesScreen(organizationId: widget.organizationId),
      EventsScreen(organizationId: widget.organizationId),
      MembersScreen(organizationId: widget.organizationId),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: body[currentIndex]),
      appBar: _buildAppBar(context),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        showSelectedLabels: false,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: currentIndex == 0
                  ? ImageConstant.onProductsScreenButton
                  : ImageConstant.offProductsScreenButton,
            ),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: currentIndex == 1
                  ? ImageConstant.onWarehousesScreenButton
                  : ImageConstant.offWarehousesScreenButton,
            ),
            label: "Warehouses",
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: currentIndex == 2
                  ? ImageConstant.onEventsScreenButton
                  : ImageConstant.offEventsScreenButton,

            ),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: currentIndex == 3
                  ? ImageConstant.onMembersScreenButton
                  : ImageConstant.offMembersScreenButton,
            ),
            label: "Members",
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 53.v,
      centerTitle: true,
      title: AppbarTitle(text: widget.organizationName),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.profileButton,
          margin: EdgeInsets.symmetric(
            horizontal: 9.h,
            vertical: 3.v,
          ),
          onTap: () async {
            Navigator.of(context).pushNamed(RouteGenerator.profile);
          },
        ),
      ],
    );
  }
}
