import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(
                  horizontal: 47.h,
                  vertical: 7.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgNotFound,
                      height: 188.adaptSize,
                      width: 188.adaptSize,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 12.v,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Изменить фото",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    SizedBox(
                      height: 25.v,
                    ),
                    Text(
                      "Имя пользователя",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 6.v,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      hintText: "Иван Иванов",
                    ),
                    SizedBox(
                      height: 16.v,
                    ),
                    Text(
                      "Email",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 6.v,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "example@mail.com",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buidlSaveButton(context),
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
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarSubtitle(
        text: "Редактировать аккаунт",
      ),
    );
  }

  Widget _buidlSaveButton(BuildContext context) {
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
