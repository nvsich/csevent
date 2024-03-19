import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewWarehouseScreen extends StatelessWidget {
  AddNewWarehouseScreen({super.key});

  TextEditingController labelController = TextEditingController();

  TextEditingController labelController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
            vertical: 19.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "Название",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 6.v,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.h),
                child: CustomTextFormField(
                  controller: labelController,
                  hintText: "например, Склад Ивана",
                ),
              ),
              SizedBox(
                height: 17.v,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "Адрес",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 5.v,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.h),
                child: CustomTextFormField(
                  controller: labelController1,
                  hintText: "например, Мясницкая, д. 11",
                  textInputAction: TextInputAction.done,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 27.v,
              ),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.imgBackIconButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "Добавить новый склад"),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Сохранить",
      margin: EdgeInsets.only(
        left: 47.h,
        right: 47.h,
        bottom: 47.v,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
