import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class FilterProductsScreen extends StatefulWidget {
  const FilterProductsScreen({super.key});

  @override
  State<FilterProductsScreen> createState() => _FilterProductsScreenState();
}

class _FilterProductsScreenState extends State<FilterProductsScreen> {
  Set<int> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 18.h,
          vertical: 15.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Тип продукта",
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(
              height: 19.v,
            ),
            _buildCategoryRow(
              context: context,
              categoryName: "Крепкий алкоголь",
              decoration: AppDecoration.fillOrange.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 1,
            ),
            SizedBox(height: 15.v),
            _buildCategoryRow(
              context: context,
              categoryName: "Легкий алкоголь",
              decoration: AppDecoration.fillBlue.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 2,
            ),
            SizedBox(height: 15.v),
            _buildCategoryRow(
              context: context,
              categoryName: "Нон-алко",
              decoration: AppDecoration.fillRed.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 3,
            ),
            SizedBox(height: 15.v),
            _buildCategoryRow(
              context: context,
              categoryName: "Сироп",
              decoration: AppDecoration.fillLightBlue.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 4,
            ),
            SizedBox(height: 15.v),
            _buildCategoryRow(
              context: context,
              categoryName: "Еда",
              decoration: AppDecoration.fillPurple.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 5,
            ),
            SizedBox(height: 15.v),
            _buildCategoryRow(
              context: context,
              categoryName: "Оборудование",
              decoration: AppDecoration.fillCyan.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 6,
            ),
            SizedBox(height: 15.v),
            _buildCategoryRow(
              context: context,
              categoryName: "Другое",
              decoration: AppDecoration.fillGray.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder3,
              ),
              categoryId: 7,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildSaveButton(context),
    );
  }

  void _selectCategory(int category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
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
          color: selectedCategories.contains(category)
              ? Colors.black
              : Colors.transparent,
          borderRadius: BorderRadius.circular(4.h),
          border: Border.all(
            color: appTheme.black900.withOpacity(0.4),
            width: 1.h,
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.imgNotFound,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "Фильтровать продукты",
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Сохранить",
      margin: EdgeInsets.only(
        left: 47.h,
        right: 47.h,
        bottom: 47.h,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
