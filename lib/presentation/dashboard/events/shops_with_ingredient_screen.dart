import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:flutter/material.dart';

class ShopsWithIngredientScreen extends StatelessWidget {
  const ShopsWithIngredientScreen({
    super.key,
    required this.ingredientName,
  });

  final String ingredientName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
              _buildShop(context, shopName: "METRO", price: "100"),
              SizedBox(
                height: 4.v,
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.backButton,
        onTap: () async {
          Navigator.of(context).pop();
        },
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: ingredientName,
      ),
    );
  }

  Widget _buildShop(
    BuildContext context, {
    required String shopName,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
      decoration: AppDecoration.outlineBlack900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shopName,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 10.v,
                ),
                Text(
                  "Перейти",
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12.v,
              bottom: 4.v,
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Цена",
                    style: CustomTextStyles.bodySmallBlack900,
                  ),
                ),
                SizedBox(
                  height: 2.v,
                ),
                Text(
                  price,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
