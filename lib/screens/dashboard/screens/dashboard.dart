import 'package:csevent/core/app_export.dart';
import 'package:csevent/screens/dashboard/screens/events/events_screen.dart';
import 'package:csevent/screens/dashboard/screens/members/members_screen.dart';
import 'package:csevent/screens/dashboard/screens/products/products_screen.dart';
import 'package:csevent/screens/dashboard/screens/warehouses/warehouses_screen.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/appbar_trailing_image.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 2;

  List<Widget> body = [
    ProductsScreen(),
    WarehousesScreen(),
    EventsScreen(),
    MembersScreen(),
  ];

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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc, color: Colors.black),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_check, color: Colors.black),
            label: "Warehouses",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.g_mobiledata, color: Colors.black),
            label: "Events",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cabin, color: Colors.black),
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
      title: AppbarTitle(text: "CSTATI"),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgProfileIconButton,
          margin: EdgeInsets.symmetric(
            horizontal: 9.h,
            vertical: 3.v,
          ),
        ),
      ],
    );
  }
}
