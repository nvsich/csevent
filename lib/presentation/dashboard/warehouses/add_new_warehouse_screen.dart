import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/create_warehouse_request.dart';
import 'package:csevent/routes/route_generator.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/warehouse_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class AddNewWarehouseScreen extends StatelessWidget {
  AddNewWarehouseScreen({
    super.key,
    required this.organizationId,
  });

  final String organizationId;

  final nameController = TextEditingController();

  final addressController = TextEditingController();

  final WarehouseService warehouseService = GetIt.I<WarehouseService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 40.h,
            vertical: 19.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "Название",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 6.v,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.h),
                child: CustomTextFormField(
                  controller: nameController,
                  hintText: "например, Склад Ивана",
                ),
              ),
              SizedBox(
                height: 17.v,
              ),
              Padding(
                padding: EdgeInsets.only(left: 7.h),
                child: Text(
                  "Адрес",
                  style: theme.textTheme.bodySmall,
                ),
              ),
              SizedBox(
                height: 5.v,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.h),
                child: CustomTextFormField(
                  controller: addressController,
                  hintText: "например, Мясницкая, д. 11",
                  textInputAction: TextInputAction.done,
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 27.v,
              ),
              _buildSaveButton(context),
            ],
          ),
        ),
      ),
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
      title: const AppbarSubtitle(text: "Добавить новый склад"),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Сохранить",
      margin: EdgeInsets.only(
        left: 47.h,
        right: 47.h,
        bottom: 47.v,
      ),
      onPressed: () async {
        String token = await cacheService.loadAuthToken();
        if (token == CacheService.noToken) {
          Fluttertoast.showToast(msg: "Ошибка аутентификации");
        }

        CreateWarehouseRequest createWarehouseRequest = CreateWarehouseRequest(
          name: nameController.text,
          address: addressController.text,
        );

        var response = await warehouseService.create(
          token,
          organizationId,
          createWarehouseRequest,
        );

        if (response.error) {
          Fluttertoast.showToast(msg: response.message!);
        } else {
          Navigator.of(context).pop(true);
        }
      },
    );
  }
}
