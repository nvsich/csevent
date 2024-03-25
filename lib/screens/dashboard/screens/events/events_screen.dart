import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(children: [
                _buildEventCardsListItemWidget(
                  context,
                  eventName: "Экватор 23",
                  eventTheme: "Barbie",
                  eventDate: "1 июля 23:00",
                  eventPlace: "Hawaii House",
                ),
                SizedBox(
                  height: 18.v,
                ),
                _buildEventCardsListItemWidget(
                  context,
                  eventName: "Экватор 23",
                  eventTheme: "Barbie",
                  eventDate: "1 июля 23:00",
                  eventPlace: "Hawaii House",
                ),
                SizedBox(
                  height: 18.v,
                ),
                _buildEventCardsListItemWidget(
                  context,
                  eventName: "Экватор 23",
                  eventTheme: "Barbie",
                  eventDate: "1 июля 23:00",
                  eventPlace: "Hawaii House",
                ),
                SizedBox(
                  height: 18.v,
                ),
                _buildEventCardsListItemWidget(
                  context,
                  eventName: "Экватор 23",
                  eventTheme: "Barbie",
                  eventDate: "1 июля 23:00",
                  eventPlace: "Hawaii House",
                ),
                SizedBox(
                  height: 18.v,
                ),
              ]),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 50,
            right: 50,
            child: Center(
              child: CustomElevatedButton(
                text: "Добавить новое мероприятие",
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteGenerator.addNewEvent);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCardsListItemWidget(
    context, {
    required String eventName,
    required String eventTheme,
    required String eventDate,
    required String eventPlace,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteGenerator.eventDetails,
          arguments: eventName,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 45,
        padding: EdgeInsets.symmetric(
          horizontal: 62.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.shadow.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              eventName,
              style: CustomTextStyles.titleLargeRegular,
            ),
            Text(
              eventTheme,
              style: CustomTextStyles.bodyLargeLight,
            ),
            SizedBox(
              height: 11.v,
            ),
            Text(
              eventDate,
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 7.v,
            ),
            Text(
              eventPlace,
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
