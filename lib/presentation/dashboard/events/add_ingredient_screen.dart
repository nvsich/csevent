import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddIngredientScreen extends StatefulWidget {
  const AddIngredientScreen({super.key});

  @override
  State<AddIngredientScreen> createState() => _AddIngredientScreen();
}

class _AddIngredientScreen extends State<AddIngredientScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController unitController = TextEditingController();

  TextEditingController amountController = TextEditingController();

  int _selectedCategory = 1;

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
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 47.h,
          vertical: 18.v,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Название",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(
              height: 6.v,
            ),
            _buildNameForm(context),
            SizedBox(
              height: 17.v,
            ),
            Text(
              "Единица измерения",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(
              height: 5.v,
            ),
            _buildUnitForm(context),
            SizedBox(
              height: 16.v,
            ),
            Text(
              "Количество",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(
              height: 6.v,
            ),
            _buildAmountForm(context),
            SizedBox(
              height: 17.v,
            ),
            Text(
              "Категория",
              style: theme.textTheme.bodySmall,
            ),
            SizedBox(
              height: 7.v,
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

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () async {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.backButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarSubtitle(
        text: "Добавить новый продукт",
      ),
    );
  }

  Widget _buildNameForm(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "например, Апельсиновый сок",
    );
  }

  Widget _buildUnitForm(BuildContext context) {
    return CustomTextFormField(
      controller: unitController,
      hintText: "например, л",
    );
  }

  Widget _buildAmountForm(BuildContext context) {
    return CustomTextFormField(
      controller: amountController,
      hintText: "например, 10",
      textInputAction: TextInputAction.done,
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
