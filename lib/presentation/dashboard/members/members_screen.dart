import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/short_user_response.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/organization_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({
    super.key,
    required this.organizationId,
  });

  final String organizationId;

  @override
  State<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends State<MembersScreen> {
  final CacheService cacheService = GetIt.I<CacheService>();

  final OrganizationService organizationService =
      GetIt.I<OrganizationService>();

  late Future<ApiResponse<List<ShortUserResponse>>> usersFuture;

  @override
  void initState() {
    super.initState();
    usersFuture = fetchUsers(widget.organizationId);
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
              child: FutureBuilder(
                future: usersFuture,
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
    return await organizationService.getAllMembers(
      token,
      organizationId,
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
