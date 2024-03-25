import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:flutter/material.dart';

class OrganizationsProfileScreen extends StatelessWidget {
  const OrganizationsProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildOrganization(
                  context,
                  name: "CSTATI",
                  role: "Участник",
                ),
                SizedBox(
                  height: 4.v,
                ),
                _buildOrganization(
                  context,
                  name: "ANTICSTATI",
                  role: "Создатель",
                ),
                _buildOrganization(
                  context,
                  name: "CSTATI",
                  role: "Участник",
                ),
                SizedBox(
                  height: 4.v,
                ),
                _buildOrganization(
                  context,
                  name: "ANTICSTATI",
                  role: "Создатель",
                ),
                _buildOrganization(
                  context,
                  name: "CSTATI",
                  role: "Участник",
                ),
                SizedBox(
                  height: 4.v,
                ),
                _buildOrganization(
                  context,
                  name: "ANTICSTATI",
                  role: "Создатель",
                ),
                _buildOrganization(
                  context,
                  name: "CSTATI",
                  role: "Участник",
                ),
                SizedBox(
                  height: 4.v,
                ),
                _buildOrganization(
                  context,
                  name: "ANTICSTATI",
                  role: "Создатель",
                ),
                _buildOrganization(
                  context,
                  name: "CSTATI",
                  role: "Участник",
                ),
                SizedBox(
                  height: 4.v,
                ),
                _buildOrganization(
                  context,
                  name: "ANTICSTATI",
                  role: "Создатель",
                ),
                _buildOrganization(
                  context,
                  name: "CSTATI",
                  role: "Участник",
                ),
                SizedBox(
                  height: 4.v,
                ),
                _buildOrganization(
                  context,
                  name: "ANTICSTATI",
                  role: "Создатель",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgNotFound,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Мои организации",
      ),
    );
  }

  Widget _buildOrganization(
    BuildContext context, {
    required String name,
    required String role,
  }) {
    return Padding(
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
              role,
              style: theme.textTheme.bodyLarge!.copyWith(
                color: appTheme.black900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
