import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:flutter/material.dart';

class MembersScreen extends StatelessWidget {
  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildMember(context),
                  _buildMember(context),
                  _buildMember(context),
                  _buildMember(context),
                  _buildMember(context),
                  _buildMember(context),
                  _buildMember(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMember(BuildContext context) {
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
                    "Иван Иванов",
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
      child: Flexible(
        child: Text(
          "Бал ФКН`23",
          style: theme.textTheme.bodySmall,
        ),
      ),
    );
  }
}
