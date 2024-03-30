import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/add_organizers_request.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/short_user_response.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/event_service.dart';
import 'package:csevent/service/organization_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class AddMemberToEventScreen extends StatefulWidget {
  const AddMemberToEventScreen({
    super.key,
    required this.organizationId,
    required this.eventId,
  });

  final String organizationId;

  final String eventId;

  @override
  State<AddMemberToEventScreen> createState() => _AddMemberToEventScreenState();
}

class _AddMemberToEventScreenState extends State<AddMemberToEventScreen> {
  final Set<String> selectedMembers = {};

  final EventService eventService = GetIt.I<EventService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  final OrganizationService organizationService =
      GetIt.I<OrganizationService>();

  late Future<ApiResponse<List<ShortUserResponse>>> membersFuture;

  @override
  void initState() {
    super.initState();
    membersFuture = fetchUsers(widget.organizationId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Container(
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
                              memberName: user.name,
                              memberId: user.id,
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
                text: "Добавить",
                onPressed: () async {
                  if (selectedMembers.isEmpty) {
                    Fluttertoast.showToast(msg: "Выберите участников");
                    return;
                  }

                  String token = await cacheService.loadAuthToken();
                  if (token == CacheService.noToken) {
                    Fluttertoast.showToast(msg: "Ошибка аутентификации");
                    return;
                  }

                  var request = AddOrganizersRequest(
                    organizerIds: selectedMembers.toList(),
                  );

                  var response = await eventService.addOrganizers(
                    token,
                    widget.organizationId,
                    widget.eventId,
                    request,
                  );

                  if (response.error) {
                    Fluttertoast.showToast(msg: response.message!);
                  } else {
                    Navigator.of(context).pop(true);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<ApiResponse<List<ShortUserResponse>>> fetchUsers(
      String organizationId) async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await organizationService.getAllMembers(token, organizationId);
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
        text: "Добавить организаторов",
      ),
    );
  }

  Widget _buildMember(
    BuildContext context, {
    required String memberName,
    required String memberId,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedMembers.contains(memberId)) {
            selectedMembers.remove(memberId);
          } else {
            selectedMembers.add(memberId);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 11.v),
        decoration: selectedMembers.contains(memberId)
            ? AppDecoration.fillGray
            : AppDecoration.outlineBlack900,
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
                      memberName,
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
