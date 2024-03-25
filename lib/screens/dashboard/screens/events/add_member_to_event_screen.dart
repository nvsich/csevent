import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class AddMemberToEventScreen extends StatefulWidget {
  const AddMemberToEventScreen({super.key});

  @override
  State<AddMemberToEventScreen> createState() => _AddMemberToEventScreenState();
}

class _AddMemberToEventScreenState extends State<AddMemberToEventScreen> {
  final Set<String> selectedMembers = {};

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
                  _buildMember(context, memberName: "1"),
                  _buildMember(context, memberName: "2"),
                  _buildMember(context, memberName: "3"),
                  _buildMember(context, memberName: "4"),
                  _buildMember(context, memberName: "5"),
                  _buildMember(context, memberName: "6"),
                  _buildMember(context, memberName: "7"),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 50,
            right: 50,
            child: Center(
              child: CustomElevatedButton(
                text: "Добавить организаторов",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.imgNotFound,
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
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedMembers.contains(memberName)) {
            selectedMembers.remove(memberName);
          } else {
            selectedMembers.add(memberName);
          }
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 11.v),
        decoration: selectedMembers.contains(memberName)
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
