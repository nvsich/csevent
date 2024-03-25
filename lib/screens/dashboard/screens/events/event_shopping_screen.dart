import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_title.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:flutter/material.dart';

class EventShoppingScreen extends StatefulWidget {
  const EventShoppingScreen({super.key});

  @override
  State<EventShoppingScreen> createState() => _EventShoppingScreenState();
}

class _EventShoppingScreenState extends State<EventShoppingScreen> {
  Set<String> selectedCategories = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildItem(
                context,
                name: "name",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id",
              ),
              _buildItem(
                context,
                name: "name1",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id1",
              ),
              _buildItem(
                context,
                name: "name2",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id2",
              ),
              _buildItem(
                context,
                name: "name3",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id3",
              ),
              _buildItem(
                context,
                name: "name",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id4",
              ),
              _buildItem(
                context,
                name: "name",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id5",
              ),
              _buildItem(
                context,
                name: "name",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id6",
              ),
              _buildItem(
                context,
                name: "name",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id7",
              ),
              _buildItem(
                context,
                name: "name",
                tag: "tag",
                amount: "amount",
                price: "price",
                id: "id8",
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
        imagePath: ImageConstant.imgNotFound,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 16.v,
          bottom: 19.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarTitle(
        text: "Закупки",
      ),
    );
  }

  Widget _buildItem(
    BuildContext context, {
    required String name,
    required String tag,
    required String amount,
    required String price,
    required String id,
  }) {
    return GestureDetector(
      onTap: () {
        _select(id);
      },
      child: Padding(
        padding: EdgeInsets.only(right: 2.h),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 14.h,
            vertical: 5.v,
          ),
          decoration: AppDecoration.outlineBlack900,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSelector(context, id),
              Padding(
                padding: EdgeInsets.only(
                  left: 13.h,
                  top: 14.v,
                  bottom: 14.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: theme.textTheme.titleLarge!.copyWith(
                        color: appTheme.black900,
                      ),
                    ),
                    SizedBox(
                      height: 8.v,
                    ),
                    IntrinsicWidth(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.h,
                          vertical: 1.v,
                        ),
                        decoration: AppDecoration.fillOrange.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder3,
                        ),
                        child: Text(
                          tag,
                          style: theme.textTheme.bodySmall!.copyWith(
                            color: appTheme.black900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  top: 2.v,
                  right: 3.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Нужно:",
                      style: CustomTextStyles.bodyMediumBlack900.copyWith(
                        color: appTheme.black900.withOpacity(0.4),
                      ),
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
                      "Стоимость:",
                      style: CustomTextStyles.bodySmallBlack900.copyWith(
                        color: appTheme.black900.withOpacity(0.4),
                      ),
                    ),
                    SizedBox(
                      height: 3.v,
                    ),
                    Text(
                      price,
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: appTheme.black900,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _select(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }
    });
  }

  Widget _buildSelector(BuildContext context, String category) {
    return GestureDetector(
      onTap: () => _select(category),
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
}
