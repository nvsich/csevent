import 'dart:io';

import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/user.dart';
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

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final CacheService cacheService = GetIt.I<CacheService>();

  final UserService userService = GetIt.I<UserService>();

  User? user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: FutureBuilder<ApiResponse<User>>(
          future: fetchUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Ошибка загрузки"));
            } else if (snapshot.hasData && !snapshot.data!.error) {
              User user = snapshot.data!.data!;
              return _buildUserProfile(context, user);
            } else {
              Fluttertoast.showToast(
                msg: snapshot.data?.message ?? "Ошибка сервера",
              );
              return Center(
                child: Text(snapshot.data?.message ?? "Ошибка сервера"),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context, User user) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 46.h,
        vertical: 7.v,
      ),
      child: Column(
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNotFound,
            height: 188.adaptSize,
            width: 188.adaptSize,
          ),
          SizedBox(
            height: 13.v,
          ),
          Text(
            user.name,
            style: CustomTextStyles.headlineSmallMedium,
          ),
          SizedBox(
            height: 6.v,
          ),
          Text(
            user.email,
            style: CustomTextStyles.titleLargeRegular,
          ),
          SizedBox(
            height: 30.v,
          ),
          CustomElevatedButton(
            text: "Редактировать",
            onPressed: () {
              Navigator.of(context).pushNamed(RouteGenerator.editProfile);
            },
          ),
          SizedBox(
            height: 14.v,
          ),
          CustomElevatedButton(
            text: "Мои организации",
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(RouteGenerator.organizationsProfile);
            },
          ),
          SizedBox(
            height: 14.v,
          ),
          CustomElevatedButton(
            text: "Выйти",
            onPressed: () {
              cacheService.deleteAuthToken();
              Navigator.of(context).pushNamed(RouteGenerator.loginScreen);
            },
          )
        ],
      ),
    );
  }

  Future<ApiResponse<User>> fetchUser() async {
    String token = await cacheService.loadAuthToken();
    if (token == CacheService.noToken) {
      Fluttertoast.showToast(msg: "Ошибка аутентификации");
    }
    return await userService.get(token);
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
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarSubtitle(text: "Аккаунт"),
    );
  }
}
