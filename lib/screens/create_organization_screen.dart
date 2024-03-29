import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/create_organization_request.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/organization_service.dart';
import 'package:csevent/widgets/app_bar/appbar_trailing_image.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_pin_code_text_field.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

import '../dto/api_response.dart';
import '../dto/organization.dart';
import '../service/cache_service.dart';

class CreateOrganization extends StatelessWidget {
  CreateOrganization({super.key});

  final titleController = TextEditingController();
  final nicknameController = TextEditingController();
  final CacheService cacheService = GetIt.I<CacheService>();
  final OrganizationService organizationService =
      GetIt.I<OrganizationService>();

  String secretCode = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 47.h,
            vertical: 33.v,
          ),
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
                    "СОЗДАТЬ ОРГАНИЗАЦИЮ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ),
              SizedBox(height: 16.v),
              Text(
                "Название",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(
                height: 6.v,
              ),
              _buildTitleLabel(context),
              SizedBox(
                height: 16.v,
              ),
              Text(
                "Никнейм",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(
                height: 6.v,
              ),
              _buildNicknameLabel(context),
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
              _buildOtpView(context),
              SizedBox(
                height: 38.v,
              ),
              _buildTf(context),
              SizedBox(
                height: 17.v,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Уже есть организация?",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 5.v,
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.signInOrganizationScreen);
                  },
                  child: Text(
                    "Войти",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 53.v,
      actions: [
        Padding(
          padding: EdgeInsets.fromLTRB(17.h, 10.v, 17.h, 11.v),
          child: Column(
            children: [
              AppbarTrailingImage(
                imagePath: ImageConstant.profileButton,
                margin: EdgeInsets.symmetric(
                  horizontal: 9.h,
                  vertical: 3.v,
                ),
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

  Widget _buildTitleLabel(BuildContext context) {
    return CustomTextFormField(
      controller: titleController,
      hintText: "например, Моя организация",
    );
  }

  Widget _buildNicknameLabel(BuildContext context) {
    return CustomTextFormField(
      controller: nicknameController,
      hintText: "только a-z0-9_.",
    );
  }

  Widget _buildOtpView(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
      ),
      child: CustomPinCodeTextField(
        context: context,
        onChanged: (value) => secretCode = value,
      ),
    );
  }

  Widget _buildTf(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () async {
        String token = await cacheService.loadAuthToken();
        if (token == CacheService.noToken) {
          Fluttertoast.showToast(msg: "Ошибка аутентификации");
        }
        CreateOrganizationRequest request = CreateOrganizationRequest(
            title: titleController.text,
            nickname: nicknameController.text,
            secretCode: secretCode);
        final ApiResponse<Organization> response =
            await organizationService.create(token, request);
        debugPrint("HERE");

        if (response.error) {
          Fluttertoast.showToast(msg: response.message ?? "Ошибка сервера");
        } else {
          Navigator.of(context).pushNamed(
            RouteGenerator.dashboard,
            arguments: response.data!.id,
          );
        }
      },
      text: "Продолжить",
      buttonStyle: CustomButtonStyles.fillPrimaryTL23,
    );
  }
}
