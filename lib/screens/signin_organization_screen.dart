import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/app_bar/appbar_trailing_image.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_pin_code_text_field.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignInOrganization extends StatelessWidget {
  SignInOrganization({super.key});

  TextEditingController labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 47.h, vertical: 30.v),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 204.h,
                  margin: EdgeInsets.only(
                    left: 39.h,
                    right: 38.h,
                  ),
                  child: Text(
                    "ВОЙТИ В ОРГАНИЗАЦИЮ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(
                height: 13.v,
              ),
              Text(
                "Никнейм",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(
                height: 6.v,
              ),
              CustomTextFormField(
                controller: labelController,
                hintText: "только a-z0-9_.",
              ),
              SizedBox(
                height: 17.v,
              ),
              Text(
                "Секретный код",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(
                height: 5.v,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.h),
                child: CustomPinCodeTextField(
                  context: context,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 38.v,
              ),
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteGenerator.dashboard);
                },
                text: "Продолжить",
                buttonStyle: CustomButtonStyles.fillPrimaryTL23,
              ),
              SizedBox(
                height: 17.v,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Еще нет организации?",
                  style: theme.textTheme.labelLarge,
                ),
              ),
              SizedBox(
                height: 1.v,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.createOrganizationScreen);
                  },
                  child: Text(
                    "Создать",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
              SizedBox(
                height: 5.v,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.v,
      actions: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.h, 11.v, 20.h, 12.v),
          child: Column(
            children: [
              SizedBox(
                height: 6.v,
              ),
              AppbarTrailingImage(
                imagePath: ImageConstant.imgNotFound,
                onTap: () {
                  Navigator.of(context).pushNamed(RouteGenerator.profile);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
