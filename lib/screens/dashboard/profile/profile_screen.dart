import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/appbar_trailing_image.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ProfileScreen extends StatelessWidget {
  final CacheService cacheService = GetIt.I<CacheService>();
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
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
                "Иван Иванов",
                style: CustomTextStyles.headlineSmallMedium,
              ),
              SizedBox(
                height: 6.v,
              ),
              Text(
                "example@mail.ru",
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
        ),
      ),
    );
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
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgNotFound,
          margin: EdgeInsets.fromLTRB(49.h, 5.v, 52.h, 5.v),
        )
      ],
    );
  }
}
