import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:flutter/material.dart';

class WarehousesWithProduct extends StatelessWidget {
  const WarehousesWithProduct({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(
        context,
        name: productId,
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 3.v),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildWarehouse(context, "Валера", "г. Троицк", "25 л"),
                  _buildWarehouse(
                      context, "Беляево", "ул. Профсоюзная 228", "25 л"),
                  _buildWarehouse(
                      context, "Покра", "Покровский бульвар 11", "25 л"),
                  _buildWarehouse(context, "Валера", "г. Троицк", "25 л"),
                  _buildWarehouse(
                      context, "Беляево", "ул. Профсоюзная 228", "25 л"),
                  _buildWarehouse(
                      context, "Покра", "Покровский бульвар 11", "25 л"),
                  _buildWarehouse(context, "Валера", "г. Троицк", "25 л"),
                  _buildWarehouse(
                      context, "Беляево", "ул. Профсоюзная 228", "25 л"),
                  _buildWarehouse(
                      context, "Покра", "Покровский бульвар 11", "25 л"),
                  _buildWarehouse(context, "Валера", "г. Троицк", "25 л"),
                  _buildWarehouse(
                      context, "Беляево", "ул. Профсоюзная 228", "25 л"),
                  _buildWarehouse(
                      context, "Покра", "Покровский бульвар 11", "25 л"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context, {
    required String name,
  }) {
    return CustomAppBar(
      height: 53.v,
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.backButton,
        onTap: () async {
          Navigator.of(context).pop();
        },
        margin: EdgeInsets.only(
          left: 18.h,
          top: 17.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: AppbarTitle(
        text: name,
      ),
    );
  }

  Widget _buildWarehouse(
    BuildContext context,
    String warehouseName,
    String warehouseAddress,
    String warehouseAmount,
  ) {
    return Container(
      margin: EdgeInsets.only(right: 2.h),
      padding: EdgeInsets.all(17.h),
      decoration: AppDecoration.outlineBlack900,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  warehouseName,
                  style: theme.textTheme.titleLarge,
                ),
                SizedBox(
                  height: 5.v,
                ),
                Text(
                  warehouseAddress,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 9.v,
              bottom: 2.v,
            ),
            child: _buildTotal(
              context,
              total: "Всего на складе:",
              amount: warehouseAmount,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTotal(
    BuildContext context, {
    required String total,
    required String amount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          total,
          style: CustomTextStyles.bodySmallBlack900.copyWith(
            color: appTheme.black900.withOpacity(0.4),
          ),
        ),
        SizedBox(
          height: 1.v,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            amount,
            style: theme.textTheme.titleMedium!.copyWith(
              color: appTheme.black900,
            ),
          ),
        )
      ],
    );
  }
}
