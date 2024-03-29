import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key, required this.eventId});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, eventName: eventId),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 114.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.red10001,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20.h),
                ),
              ),
            ),
            SizedBox(height: 16.v),
            Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                eventId,
                style: theme.textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                "Barbie",
                style: CustomTextStyles.titleLargeLight,
              ),
            ),
            SizedBox(height: 11.v),
            Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                "1 июля 23:00",
                style: CustomTextStyles.titleLargeLight,
              ),
            ),
            SizedBox(height: 11.v),
            Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                "Hawaii House",
                style: CustomTextStyles.titleLargeRegular,
              ),
            ),
            SizedBox(height: 9.v),
            Padding(
              padding: EdgeInsets.only(left: 21.h),
              child: Text(
                "200 гостей",
                style: CustomTextStyles.titleLargeRegular,
              ),
            ),
            SizedBox(height: 37.v),
            _buildEditButton(context),
            SizedBox(height: 14.v),
            _buildOrganizatorsButton(context),
            SizedBox(height: 14.v),
            _buildBarCardButton(context),
            SizedBox(height: 14.v),
            _buildBuyingsButton(context),
          ],
        ),
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
      title: AppbarTitle(
        text: eventName,
      ),
    );
  }

  Widget _buildEditButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RouteGenerator.editEvent);
      },
      text: "Редактировать",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL23,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }

  Widget _buildOrganizatorsButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RouteGenerator.eventMembers);
      },
      text: "Организаторы",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL23,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }

  Widget _buildBarCardButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RouteGenerator.eventBarCard);
      },
      text: "Барная карта",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL23,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }

  Widget _buildBuyingsButton(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(RouteGenerator.eventShopping);
      },
      text: "Закупки",
      margin: EdgeInsets.only(
        left: 43.h,
        right: 51.h,
      ),
      buttonStyle: CustomButtonStyles.outlineBlackTL23,
      buttonTextStyle: CustomTextStyles.bodyMediumBlack900,
      alignment: Alignment.center,
    );
  }
}
