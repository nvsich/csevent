import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/create_or_update_cocktail_request.dart';
import 'package:csevent/dto/enum/cocktail_type.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/cocktail_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class AddCocktailScreen extends StatefulWidget {
  const AddCocktailScreen({
    super.key,
    required this.organizationId,
    required this.eventId,
  });

  final String organizationId;

  final String eventId;

  @override
  State<AddCocktailScreen> createState() => _AddCocktailScreenState();
}

class _AddCocktailScreenState extends State<AddCocktailScreen> {
  final nameController = TextEditingController();

  final CacheService cacheService = GetIt.I<CacheService>();

  final CocktailService cocktailService = GetIt.I<CocktailService>();

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
          vertical: 19.v,
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
            SizedBox(
              height: 6.v,
            ),
            CustomTextFormField(
              controller: nameController,
              hintText: "например, Лонг-Айленд",
              textInputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 28.v,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 1.h,
              ),
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
          ],
        ),
      ),
      bottomNavigationBar: _buildSaveButton(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 55.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () async {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.backButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarSubtitle(
        text: "Добавить коктейль",
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

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Сохранить",
      onPressed: () async {
        String token = await cacheService.loadAuthToken();
        if (token == CacheService.noToken) {
          Fluttertoast.showToast(msg: "Ошибка аутентификации");
        }

        CreateOrUpdateCocktailRequest request = CreateOrUpdateCocktailRequest(
          name: nameController.text,
          type: _selectedCategory == 1
              ? CocktailType.HIGHBALL
              : CocktailType.SHOT,
        );

        var response = await cocktailService.create(
          token,
          widget.organizationId,
          widget.eventId,
          request,
        );

        if (response.error) {
          Fluttertoast.showToast(msg: response.message!);
        } else {
          Navigator.of(context).pop(true);
        }
      },
      margin: EdgeInsets.only(
        left: 47.h,
        right: 47.h,
        bottom: 47.v,
      ),
    );
  }
}
