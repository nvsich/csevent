import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class WarehouseDetailsScreen extends StatelessWidget {
  const WarehouseDetailsScreen({
    super.key,
    required this.warehouseId,
  });

  final String warehouseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(
        context: context,
        name: warehouseId,
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              vertical: 11.v,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                  _buildProduct(
                    context: context,
                    productName: "productName",
                    productType: "productType",
                    productAmount: "productAmount",
                  ),
                  SizedBox(
                    height: 4.v,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 50,
            right: 50,
            child: Center(
              child: CustomElevatedButton(
                text: "Добавить новый продукт",
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(RouteGenerator.addProductToWarehouse);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar({
    required BuildContext context,
    required String name,
  }) {
    return CustomAppBar(
      height: 53.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        onTap: () {
          Navigator.of(context).pop();
        },
        imagePath: ImageConstant.imgNotFound,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: name,
      ),
    );
  }

  Widget _buildProduct({
    required BuildContext context,
    required String productName,
    required String productType,
    required String productAmount,
  }) {
    return Container(
      margin: EdgeInsets.only(right: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 18.v),
      decoration: AppDecoration.outlineBlack900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: theme.textTheme.titleLarge,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 6.h,
                  vertical: 2.v,
                ),
                decoration: AppDecoration.fillRed.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder3,
                ),
                child: Flexible(
                  child: Text(
                    productType,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
            ],
          ),
          _buildTotal(
            context: context,
            amount: productAmount,
          ),
        ],
      ),
    );
  }

  Widget _buildTotal({required BuildContext context, required String amount}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Всего на складах:",
          style: CustomTextStyles.bodySmallBlack900.copyWith(
            color: appTheme.black900.withOpacity(0.4),
          ),
        ),
        SizedBox(
          height: 1.v,
        ),
        Text(
          amount,
          style: theme.textTheme.titleMedium!.copyWith(
            color: appTheme.black900,
          ),
        ),
        SizedBox(
          height: 6.v,
        ),
        Text(
          "На каких складах?",
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.colorScheme.primary,
          ),
        )
      ],
    );
  }
}
