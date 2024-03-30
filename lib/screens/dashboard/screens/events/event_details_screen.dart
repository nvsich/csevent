import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/event.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/event_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({
    super.key,
    required this.organizationId,
    required this.eventId,
  });

  final String organizationId;

  final String eventId;

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  final EventService eventService = GetIt.I<EventService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  late Future<ApiResponse<Event>> eventFuture;

  @override
  void initState() {
    super.initState();
    eventFuture = fetchEvent(
      organizationId: widget.organizationId,
      eventId: widget.eventId,
    );
  }

  void refreshState() {
    setState(() {
      eventFuture = fetchEvent(
        organizationId: widget.organizationId,
        eventId: widget.eventId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: eventFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("Ошибка загрузки"));
        } else if (snapshot.hasData && !snapshot.data!.error) {
          Event event = snapshot.data!.data!;
          return _buildPage(
            context,
            eventName: event.name,
            eventTheme: event.theme,
            eventDate: event.dateTime,
            eventColor: event.color,
            eventGuests: event.guests.toString(),
            eventAddress: event.address,
          );
        } else {
          Fluttertoast.showToast(
            msg: snapshot.data?.message ?? "Ошибка сервера",
          );
          return Center(
            child: Text(snapshot.data?.message ?? "Ошибка сервера"),
          );
        }
      },
    );
  }

  Widget _buildPage(
    BuildContext context, {
    required String eventName,
    required String eventTheme,
    required String eventDate,
    required String eventColor,
    required String eventGuests,
    required String eventAddress,
  }) {
    return Scaffold(
      appBar: _buildAppBar(context, eventName: eventName),
      body: _buildEventDetails(
        context,
        eventName: eventName,
        eventTheme: eventTheme,
        eventDate: eventDate,
        eventColor: eventColor,
        eventGuests: eventGuests,
        eventPlace: eventAddress,
      ),
    );
  }

  Future<ApiResponse<Event>> fetchEvent({
    required String organizationId,
    required String eventId,
  }) async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await eventService.get(token, organizationId, eventId);
  }

  Widget _buildEventDetails(
    BuildContext context, {
    required String eventName,
    required String eventTheme,
    required String eventDate,
    required String eventColor,
    required String eventGuests,
    required String eventPlace,
  }) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 114.v,
            width: double.maxFinite,
            decoration: AppDecoration.getDecorationByColor(eventColor).copyWith(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.h),
              ),
            ),
          ),
          SizedBox(height: 16.v),
          Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Text(
              eventName,
              style: theme.textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Text(
              eventTheme,
              style: CustomTextStyles.titleLargeLight,
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Text(
              eventDate,
              style: CustomTextStyles.titleLargeLight,
            ),
          ),
          SizedBox(height: 11.v),
          Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Text(
              eventPlace,
              style: CustomTextStyles.titleLargeRegular,
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 21.h),
            child: Text(
              eventGuests,
              style: CustomTextStyles.titleLargeRegular,
            ),
          ),
          SizedBox(height: 37.v),
          _buildEditButton(context, color: eventColor),
          SizedBox(height: 14.v),
          _buildOrganizatorsButton(context, color: eventColor),
          SizedBox(height: 14.v),
          _buildBarCardButton(context, color: eventColor),
          SizedBox(height: 14.v),
          _buildBuyingsButton(context, color: eventColor),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    required String eventName,
  }) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () async {
          Navigator.of(context).pop(true);
        },
        imagePath: ImageConstant.backButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: eventName,
      ),
    );
  }

  Widget _buildEditButton(
    BuildContext context, {
    required String color,
  }) {
    return CustomElevatedButton(
      onPressed: () async {
        var result = await Navigator.of(context).pushNamed(
          RouteGenerator.editEvent,
          arguments: <String, String>{
            'organizationId': widget.organizationId,
            'eventId': widget.eventId,
          },
        );
        if (result == true) {
          refreshState();
        }
      },
      text: "Редактировать",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppDecoration.getColorByString(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.15),
        elevation: 4,
      ),
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }

  Widget _buildOrganizatorsButton(
    BuildContext context, {
    required String color,
  }) {
    return CustomElevatedButton(
      onPressed: () async {
        await Navigator.of(context)
            .pushNamed(RouteGenerator.eventMembers, arguments: <String, String>{
          'organizationId': widget.organizationId,
          'eventId': widget.eventId,
        });
      },
      text: "Организаторы",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppDecoration.getColorByString(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.15),
        elevation: 4,
      ),
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }

  Widget _buildBarCardButton(
    BuildContext context, {
    required String color,
  }) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(
          RouteGenerator.eventBarCard,
          arguments: <String, String>{
            'organizationId': widget.organizationId,
            'eventId': widget.eventId,
          },
        );
      },
      text: "Барная карта",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppDecoration.getColorByString(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.15),
        elevation: 4,
      ),
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }

  Widget _buildBuyingsButton(
    BuildContext context, {
    required String color,
  }) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RouteGenerator.eventShopping);
      },
      text: "Закупки",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: AppDecoration.getColorByString(color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23.h),
        ),
        shadowColor: appTheme.black900.withOpacity(0.15),
        elevation: 4,
      ),
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }
}
