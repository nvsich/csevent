import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/organization.dart';
import 'package:csevent/dto/sign_in_organization_request.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/organization_service.dart';
import 'package:csevent/widgets/app_bar/appbar_trailing_image.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_pin_code_text_field.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';

import '../../dto/api_response.dart';

class SignInOrganization extends StatelessWidget {
  SignInOrganization({super.key});

  final labelController = TextEditingController();
  String secretCode = "";
  final CacheService cacheService = GetIt.I<CacheService>();
  final OrganizationService organizationService =
      GetIt.I<OrganizationService>();

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
                  onChanged: (value) => secretCode = value,
                ),
              ),
              SizedBox(
                height: 38.v,
              ),
              CustomElevatedButton(
                onPressed: () async {
                  String token = await cacheService.loadAuthToken();
                  if (token == CacheService.noToken) {
                    Fluttertoast.showToast(msg: "Ошибка аутентификации");
                  }
                  SignInOrganizationRequest request = SignInOrganizationRequest(
                      nickname: labelController.text, secretCode: secretCode);
                  final ApiResponse<Organization> response =
                      await organizationService.signIn(token, request);
                  if (response.error) {
                    Fluttertoast.showToast(
                        msg: response.message ?? "Ошибка сервера");
                  } else {
                    Navigator.of(context).pushNamed(
                      RouteGenerator.dashboard,
                      arguments: <String, String>{
                        'organizationId': response.data!.id,
                        'organizationName': response.data!.title,
                      },
                    );
                  }
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
                imagePath: ImageConstant.profileButton,
                onTap: () async {
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
