import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/enum/role.dart';
import 'package:csevent/dto/short_organization_response.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/user_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class OrganizationsProfileScreen extends StatelessWidget {
  OrganizationsProfileScreen({super.key});

  final UserService userService = GetIt.I<UserService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Stack(
          children: [
            SizedBox(
              width: double.maxFinite,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    FutureBuilder(
                      future: fetchOrganizations(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('Ошибка загрузки'),
                          );
                        } else if (snapshot.hasData) {
                          List<ShortOrganizationResponse> events =
                              snapshot.data!.data!;
                          return ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              ShortOrganizationResponse organization =
                                  events[index];
                              return _buildOrganization(
                                context,
                                organizationId: organization.id,
                                name: organization.title,
                                role: organization.role,
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
                  text: "Создать новую организацию",
                  onPressed: () async {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.createOrganizationScreen);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<ApiResponse<List<ShortOrganizationResponse>>>
      fetchOrganizations() async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await userService.getOrganizations(token);
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () async {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.backButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarSubtitle(
        text: "Мои организации",
      ),
    );
  }

  Widget _buildOrganization(
    BuildContext context, {
    required String organizationId,
    required String name,
    required Role role,
  }) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).pushNamed(
          RouteGenerator.dashboard,
          arguments: <String, String>{
            'organizationId': organizationId,
            'organizationName': name,
          },
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 1.h),
        child: Container(
          width: 375.h,
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 8.v,
          ),
          decoration: AppDecoration.outlineBlack900,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 4.v,
              ),
              Text(
                name,
                style: theme.textTheme.titleLarge!.copyWith(
                  color: appTheme.black900,
                ),
              ),
              SizedBox(
                height: 6.v,
              ),
              Text(
                role == Role.OWNER ? "Создатель" : "Участник",
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
