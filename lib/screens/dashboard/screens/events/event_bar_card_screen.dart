import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/enum/cocktail_type.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class EventBarCardScreen extends StatelessWidget {
  const EventBarCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildDrink(context, "Джин тоник", CocktailType.SHOT),
                  _buildDrink(context, "Лонг-Айленд", CocktailType.HIGHBALL),
                  _buildDrink(context, "Отвертка", CocktailType.HIGHBALL),
                  _buildDrink(context, "Джин тоник", CocktailType.SHOT),
                  _buildDrink(context, "Лонг-Айленд", CocktailType.HIGHBALL),
                  _buildDrink(context, "Отвертка", CocktailType.HIGHBALL),
                  _buildDrink(context, "Джин тоник", CocktailType.SHOT),
                  _buildDrink(context, "Лонг-Айленд", CocktailType.HIGHBALL),
                  _buildDrink(context, "Отвертка", CocktailType.HIGHBALL),
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
                text: "Добавить коктейль",
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteGenerator.addCocktail);
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
      title: const AppbarTitle(
        text: "Барная карта",
      ),
    );
  }

  Widget _buildDrink(
    BuildContext context,
    String drinkName,
    CocktailType cocktailType,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteGenerator.cocktailDetails,
          arguments: drinkName,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 1.h),
        padding: EdgeInsets.symmetric(vertical: 11.v),
        decoration: AppDecoration.outlineBlack900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: switch (cocktailType) {
                CocktailType.SHOT => ImageConstant.shotDrink,
                CocktailType.HIGHBALL => ImageConstant.longDrink,
                _ => ImageConstant.imgNotFound,
              },
              height: 66.adaptSize,
              width: 66.adaptSize,
              margin: EdgeInsets.only(left: 17.h),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  top: 9.v,
                  bottom: 9.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinkName,
                      style: theme.textTheme.titleLarge,
                    ),
                    SizedBox(
                      height: 7.v,
                    ),
                    Wrap(
                      runSpacing: 10.v,
                      spacing: 10.h,
                      children: List<Widget>.generate(
                          3, (index) => _buildTagsrowItemWidget()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTagsrowItemWidget() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 6.h,
        vertical: 2.v,
      ),
      decoration: AppDecoration.fillBlue.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder3,
      ),
      child: Text(
        "Белый ром",
        style: theme.textTheme.bodySmall,
      ),
    );
  }
}
