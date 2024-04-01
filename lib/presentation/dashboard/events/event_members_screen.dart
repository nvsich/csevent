import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/short_user_response.dart';
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

class EventMembersScreen extends StatefulWidget {
  const EventMembersScreen({
    super.key,
    required this.organizationid,
    required this.eventId,
  });

  final String organizationid;

  final String eventId;

  @override
  State<EventMembersScreen> createState() => _EventMembersScreenState();
}

class _EventMembersScreenState extends State<EventMembersScreen> {
  final EventService eventService = GetIt.I<EventService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  late Future<ApiResponse<List<ShortUserResponse>>> membersFuture;

  @override
  void initState() {
    super.initState();
    membersFuture = fetchMembers(
      organizationId: widget.organizationid,
      eventId: widget.eventId,
    );
  }

  void refreshState() {
    setState(() {
      membersFuture = fetchMembers(
        organizationId: widget.organizationid,
        eventId: widget.eventId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  FutureBuilder(
                    future: membersFuture,
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
                        List<ShortUserResponse> users = snapshot.data!.data!;
                        return ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            ShortUserResponse user = users[index];
                            return _buildMember(
                              context,
                              name: user.name,
                            );
                          },
                        );
                      } else {
                        return const Center(
                          child: Text('Нет данных'),
                        );
                      }
                    },
                  )
                ],
              ),
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
                text: "Добавить организаторов",
                onPressed: () async {
                  var result = await Navigator.of(context).pushNamed(
                    RouteGenerator.addNewMemberToEvent,
                    arguments: <String, String>{
                      'organizationId': widget.organizationid,
                      'eventId': widget.eventId,
                    },
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

  Future<ApiResponse<List<ShortUserResponse>>> fetchMembers({
    required String organizationId,
    required String eventId,
  }) async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await eventService.getOrganizers(token, organizationId, eventId);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
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
      title: const AppbarTitle(
        text: "Организаторы",
      ),
    );
  }

  Widget _buildMember(
    BuildContext context, {
    required String name,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(vertical: 11.v),
      decoration: AppDecoration.outlineBlack900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNotFound,
            height: 66.adaptSize,
            width: 66.adaptSize,
            margin: EdgeInsets.only(bottom: 6.v),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                left: 15.h,
                top: 9.v,
                bottom: 9.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 7.v,
                  ),
                  Wrap(
                    runSpacing: 10.v,
                    spacing: 10.h,
                    children: List<Widget>.generate(
                        3, (index) => _buildTagsrowItemWidget()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagsrowItemWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.fillBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder3,
      ),
      child: Text(
        "Бал ФКН`23",
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}
