import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CocktailDetailsScreen extends StatefulWidget {
  const CocktailDetailsScreen({super.key, required this.cocktailId});

  final String cocktailId;

  @override
  State<CocktailDetailsScreen> createState() => _CocktailDetailsScreenState();
}

class _CocktailDetailsScreenState extends State<CocktailDetailsScreen> {
  final nameController = TextEditingController();

  int _selectedCategory = 0;

  void _selectCategory(int category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 46.h,
              vertical: 21.v,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 1.h,
                    ),
                    child: Text(
                      "Название",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    height: 6.v,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: CustomTextFormField(
                      controller: nameController,
                      hintText: widget.cocktailId,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(
                    height: 28.v,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      "Категория",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    height: 9.v,
                  ),
                  _buildCategoryRow(
                    context: context,
                    categoryName: "Лонг",
                    decoration: const BoxDecoration(),
                    categoryId: 1,
                  ),
                  SizedBox(
                    height: 9.v,
                  ),
                  _buildCategoryRow(
                    context: context,
                    categoryName: "Шот",
                    decoration: const BoxDecoration(),
                    categoryId: 2,
                  ),
                  SizedBox(
                    height: 21.v,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 2.h,
                    ),
                    child: Text(
                      "Ингредиенты",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                  SizedBox(
                    height: 6.v,
                  ),
                  _buildIngr(
                    context,
                    tag: "Белый ром",
                    amount: "10 л",
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  _buildIngr(
                    context,
                    tag: "Джин",
                    amount: "10 л",
                  ),
                  SizedBox(
                    height: 10.v,
                  ),
                  _buildAddIngrButton(context),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20.0,
                left: 50,
                right: 50,
              ),
              child: CustomElevatedButton(
                text: "Сохранить",
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
      height: 53.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgNotFound,
        onTap: () {
          Navigator.of(context).pop();
        },
        margin: EdgeInsets.only(
          left: 18.h,
          top: 17.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarTitle(
        text: "Коктейль",
      ),
    );
  }

  Widget _buildCategoryRow({
    required BuildContext context,
    required String categoryName,
    required Decoration decoration,
    required int categoryId,
  }) {
    return Row(
      children: [
        _buildCategorySelectorBox(context, categoryId),
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 12.h),
            padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 1.v),
            decoration: decoration,
            child: Text(
              categoryName,
              style: theme.textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySelectorBox(BuildContext context, int category) {
    return GestureDetector(
      onTap: () => _selectCategory(category),
      child: Container(
        height: 17.adaptSize,
        width: 17.adaptSize,
        margin: EdgeInsets.symmetric(
          vertical: 2.v,
        ),
        decoration: BoxDecoration(
          color:
              _selectedCategory == category ? Colors.black : Colors.transparent,
          borderRadius: BorderRadius.circular(4.h),
          border: Border.all(
            color: appTheme.black900.withOpacity(0.4),
            width: 1.h,
          ),
        ),
      ),
    );
  }

  Widget _buildIngr(
    BuildContext context, {
    required String tag,
    required String amount,
  }) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(
          left: 2.h,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 6.h,
                vertical: 1.v,
              ),
              decoration: AppDecoration.fillRed.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              child: Text(
                tag,
                style: theme.textTheme.bodySmall!.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 3.v,
                bottom: 2.v,
              ),
              child: Text(
                amount,
                style: CustomTextStyles.labelLargeBlack900.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddIngrButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RouteGenerator.addIngredient);
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: 2.h,
        ),
        child: Text(
          "Добавить ингредиент",
          style: theme.textTheme.labelLarge,
        ),
      ),
    );
  }
}
