import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController labelController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                padding: EdgeInsets.only(left: 47.h, top: 87.v, right: 47.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "CSEVENT",
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                    SizedBox(
                      height: 37.v,
                    ),
                    Text(
                      "Имя пользователя",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 6.v,
                    ),
                    _buildLabel(context),
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
                    _buildEmail(context),
                    SizedBox(
                      height: 17.v,
                    ),
                    Text(
                      "Пароль",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 5.v,
                    ),
                    _buildPassword(context),
                    SizedBox(
                      height: 17.v,
                    ),
                    Text(
                      "Повторите пароль",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 5.v,
                    ),
                    _buildPassword1(context),
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
                        "Уже есть аккаунт?",
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(
                      height: 5.v,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteGenerator.loginScreen);
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
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context) {
    return CustomTextFormField(
      controller: labelController,
      hintText: "например, Иван Иванов",
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "например, example@mail.com",
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "например, my_password123",
      textInputType: TextInputType.visiblePassword,
      obscureText: true,
    );
  }

  Widget _buildPassword1(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController1,
      hintText: "например, my_password123",
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
    );
  }

  Widget _buildTf(BuildContext context) {
    return CustomElevatedButton(
      onPressed: () {
        Navigator.of(context)
            .pushNamed(RouteGenerator.signInOrganizationScreen);
      },
      text: "Продолжить",
      buttonStyle: CustomButtonStyles.fillPrimaryTL23,
    );
  }
}
