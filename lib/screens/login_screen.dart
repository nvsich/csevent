import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/auth_service.dart';
import 'package:csevent/service/cash_service.dart';
import 'package:csevent/dto/sign_in_request.dart';
import 'package:csevent/dto/api_response.dart';
import 'package:csevent/dto/jwt_authentication_response.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:get_it/get_it.dart';

class LoginScreen extends StatelessWidget {
  final AuthService authService = GetIt.I<AuthService>();
  final CashService cashService = GetIt.I<CashService>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom:
              MediaQuery.of(context).viewInsets.bottom,
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
                    SizedBox(height: 37.v),
                    Text("Email", style: theme.textTheme.bodySmall),
                    SizedBox(height: 6.v),
                    CustomTextFormField(
                      controller: emailController,
                      hintText: "например, example@mail.com",
                    ),
                    SizedBox(height: 17.v),
                    Text("Пароль", style: theme.textTheme.bodySmall),
                    CustomTextFormField(
                      controller: passwordController,
                      hintText: "например, my_password123",
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(height: 38.v),
                    CustomElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          SignInRequest request = SignInRequest(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          final ApiResponse<JwtAuthenticationResponse> response = await authService.signIn(request);
                          if (response.error) {
                            Fluttertoast.showToast(msg: response.message ?? "Ошибка аутентификации");
                          } else {
                            cashService.saveAuthToken(response.data!.token);
                            Navigator.of(context).pushNamed(RouteGenerator.profile);
                          }
                        }
                      },
                      text: "Продолжить",
                      buttonStyle: CustomButtonStyles.fillPrimaryTL23,
                    ),
                    SizedBox(height: 17.v),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Еще нет аккаунта?", style: theme.textTheme.bodySmall),
                    ),
                    SizedBox(height: 1.v),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteGenerator.signupScreen);
                        },
                        child: Text("Зарегистрироваться", style: theme.textTheme.labelLarge),
                      ),
                    ),
                    SizedBox(height: 5.v),
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
