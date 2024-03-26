import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class IngredientInforScreen extends StatelessWidget {
  IngredientInforScreen({super.key, required this.ingredientId});

  final String ingredientId;

  final priceController = TextEditingController();

  final warehouseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context, name: ingredientId),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 19.h,
          vertical: 17.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Всего на складах",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(
              height: 9.v,
            ),
            Text(
              "20 л",
              style: CustomTextStyles.titleMediumMedium,
            ),
            SizedBox(
              height: 4.v,
            ),
            Text(
              "На каких складах?",
              style: theme.textTheme.labelLarge,
            ),
            SizedBox(
              height: 20.v,
            ),
            Text(
              "Цена за единицу измерения",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(
              height: 9.v,
            ),
            Row(
              children: [
                CustomTextFormField(
                  width: 92.h,
                  controller: priceController,
                  hintText: "100",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 9.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 13.h,
                    top: 10.v,
                    bottom: 5.v,
                  ),
                  child: Text(
                    "руб",
                    style: CustomTextStyles.titleMediumMedium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.v,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.shopsWithIngredient,
                  arguments: ingredientId,
                );
              },
              child: Text(
                "Узнать стоимость",
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(
              height: 18.v,
            ),
            Text(
              "Итого",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(
              height: 9.v,
            ),
            Text(
              "Взято на складе",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 4.v,
            ),
            Row(
              children: [
                CustomTextFormField(
                  width: 92.h,
                  controller: warehouseController,
                  hintText: "20",
                  textInputAction: TextInputAction.done,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.h,
                    vertical: 9.v,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 15.h,
                    top: 8.v,
                    bottom: 7.v,
                  ),
                  child: Text(
                    "л",
                    style: CustomTextStyles.titleMediumMedium,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 18.v,
            ),
            Text(
              "Нужно докупить",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 4.v,
            ),
            Text(
              "20 л",
              style: CustomTextStyles.titleMediumMedium,
            ),
            SizedBox(
              height: 17.v,
            ),
            Text(
              "Итоговая стоимость",
              style: theme.textTheme.bodyLarge,
            ),
            SizedBox(
              height: 7.v,
            ),
            Text(
              "2000 руб",
              style: CustomTextStyles.titleMediumMedium,
            ),
            SizedBox(
              height: 5.v,
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    required String name,
  }) {
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
      title: AppbarSubtitle(
        text: name,
      ),
    );
  }
}
