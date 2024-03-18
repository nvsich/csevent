import 'package:csevent/routes/route_generator.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(RouteGenerator.eventsScreen);
        },
        child: Text("TESTTESTSTS"),
      ),
    );
  }
}