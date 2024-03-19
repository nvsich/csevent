import 'package:csevent/core/app_export.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  _buildSearch(context),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
                  _buildProduct(
                    context: context,
                    productName: "Белый ром",
                    productType: "Крепкий алкоголь",
                    productAmount: "30 л",
                  ),
                  SizedBox(height: 4.v),
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
                  Navigator.of(context).pushNamed(RouteGenerator.addNewProduct);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 13.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: CustomSearchView(
              controller: searchController,
              hintText: "Введите название продукта",
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFilter,
            height: 21.v,
            width: 24.h,
            margin: EdgeInsets.only(
              left: 16.h,
              top: 12.v,
              bottom: 13.v,
            ),
          )
        ],
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
