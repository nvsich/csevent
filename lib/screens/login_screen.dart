import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

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
                padding: EdgeInsets.only(
                  left: 47.h,
                  top: 87.v,
                  right: 47.h,
                ),
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
                      "Email",
                      style: theme.textTheme.bodySmall,
                    ),
                    SizedBox(
                      height: 6.v,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "например, example@mail.com",
                    ),
                    SizedBox(
                      height: 17.v,
                    ),
                    Text(
                      "Пароль",
                      style: theme.textTheme.bodySmall,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "например, my_password123",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 38.v,
                    ),
                    CustomElevatedButton(
                      text: "Продолжить",
                      buttonStyle: CustomButtonStyles.fillPrimaryTL23,
                    ),
                    SizedBox(
                      height: 17.v,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Еще нет аккаунта?",
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(
                      height: 1.v,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text(
                          "Зарегистрироваться",
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
          ),
        ),
      ),
    );
  }
}
