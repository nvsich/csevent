import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/short_event_response.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/event_service.dart';
import 'package:csevent/widgets/custom_dismissible_widget.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({
    super.key,
    required this.organizationId,
  });

  final String organizationId;

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final EventService eventService = GetIt.I<EventService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  late Future<ApiResponse<List<ShortEventResponse>>> eventsFuture;

  @override
  void initState() {
    super.initState();
    eventsFuture = fetchEvents(widget.organizationId);
  }

  void refreshState() {
    setState(() {
      eventsFuture = fetchEvents(widget.organizationId);
    });
  }

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
                FutureBuilder(
                  future: eventsFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Ошибка загрузки'),
                      );
                    } else if (snapshot.hasData) {
                      List<ShortEventResponse> events = snapshot.data!.data!;
                      return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          ShortEventResponse eventResponse = events[index];
                          return _buildDismissibleEvent(
                            context,
                            eventId: eventResponse.id,
                            eventName: eventResponse.name,
                            eventColor: eventResponse.color,
                            eventDate: eventResponse.dateTime,
                            eventPlace: eventResponse.address,
                            eventTheme: eventResponse.theme,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('Нет данных'),
                      );
                    }
                  },
                ),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
                left: 50,
                right: 50,
              ),
              child: CustomElevatedButton(
                text: "Добавить новое мероприятие",
                onPressed: () async {
                  final result = await Navigator.of(context).pushNamed(
                    RouteGenerator.addNewEvent,
                    arguments: widget.organizationId,
                  );

                  if (result == true) {
                    refreshState();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<ApiResponse<List<ShortEventResponse>>> fetchEvents(
      String organizationId) async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await eventService.getAll(token, organizationId);
  }

  Widget _buildDismissibleEvent(
    BuildContext context, {
    required String eventId,
    required String eventName,
    required String eventColor,
    required String eventDate,
    required String eventPlace,
    required String eventTheme,
  }) {
    final Key dismissKey = ValueKey(eventId);

    return CustomDismissibleWidget(
      keyDismiss: dismissKey,
      direction: DismissDirection.endToStart,
      onDismissed: (direction) async {
        String token = await cacheService.loadAuthToken();
        if (token == CacheService.noToken) {
          Fluttertoast.showToast(msg: "Ошибка аутентификации");
        }
        final result = await eventService.delete(
          token,
          widget.organizationId,
          eventId,
        );

        if (result.error) {
          Fluttertoast.showToast(msg: result.message!);
        }

        refreshState();
      },
      child: _buildEventCardsListItemWidget(
        context,
        eventId: eventId,
        eventName: eventName,
        eventDate: eventDate,
        eventPlace: eventPlace,
        eventColor: eventColor,
        eventTheme: eventTheme,
      ),
    );
  }

  Widget _buildEventCardsListItemWidget(
    context, {
    required String eventId,
    required String eventName,
    required String eventTheme,
    required String eventDate,
    required String eventPlace,
    required String eventColor,
  }) {
    return GestureDetector(
      onTap: () async {
        var result = await Navigator.of(context).pushNamed(
          RouteGenerator.eventDetails,
          arguments: <String, String>{
            'eventId': eventId,
            'organizationId': widget.organizationId,
          },
        );

        if (result == true) {
          refreshState();
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(
          horizontal: 62.h,
          vertical: 22.v,
        ),
        decoration:
            AppDecoration.getShadowDecorationByColor(eventColor).copyWith(
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
