import 'package:csevent/core/app_export.dart';
import 'package:csevent/dto/create_or_update_event_request.dart';
import 'package:csevent/service/cache_service.dart';
import 'package:csevent/service/event_service.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';

class AddNewEventScreen extends StatefulWidget {
  AddNewEventScreen({
    super.key,
    required this.organizationid,
  });

  final String organizationid;

  @override
  State<AddNewEventScreen> createState() => _AddNewEventScreenState();
}

class _AddNewEventScreenState extends State<AddNewEventScreen> {
  final EventService eventService = GetIt.I<EventService>();

  final CacheService cacheService = GetIt.I<CacheService>();

  TextEditingController nameController = TextEditingController();

  TextEditingController themeController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController guestsController = TextEditingController();

  int _selectedColor = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              SizedBox(height: 6.v),
              _buildName(context),
              SizedBox(height: 16.v),
              Text(
                "Тематика",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 6.v),
              _buildTheme(context),
              SizedBox(height: 16.v),
              Text(
                "Адрес",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 6.v),
              _buildAddress(context),
              SizedBox(height: 16.v),
              Text(
                "Дата",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 6.v),
              _buildDate(context),
              SizedBox(height: 16.v),
              Text(
                "Количество гостей",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 6.v),
              _buildGuests(context),
              SizedBox(height: 16.v),
              Text(
                "Цвет",
                style: theme.textTheme.bodySmall,
              ),
              SizedBox(height: 8.v),
              _buildColorsRow(),
            ],
          ),
        ),
        bottomNavigationBar: _buildSaveButton(context),
      ),
    );
  }

  void _selectCategory(int color) {
    setState(() {
      _selectedColor = color;
    });
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
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: const AppbarSubtitle(text: "Добавить мероприятие"),
    );
  }

  Widget _buildName(BuildContext context) {
    return CustomTextFormField(
      controller: nameController,
      hintText: "например, Экватор`23",
    );
  }

  Widget _buildTheme(BuildContext context) {
    return CustomTextFormField(
      controller: themeController,
      hintText: "например, Barbie",
    );
  }

  Widget _buildAddress(BuildContext context) {
    return CustomTextFormField(
      controller: addressController,
      hintText: "например, Hawaii House",
    );
  }

  Widget _buildDate(BuildContext context) {
    return CustomTextFormField(
      controller: dateController,
      hintText: "например, 1 июля 23:00",
    );
  }

  Widget _buildGuests(BuildContext context) {
    return CustomTextFormField(
      controller: guestsController,
      hintText: "например, 200",
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

        int? guests = int.tryParse(guestsController.text);
        if (guests == null) {
          Fluttertoast.showToast(msg: "Неверное количество гостей");
          return;
        }

        String color = "purple50";
        switch (_selectedColor) {
          case 1:
            color = "fillPurple";
            break;

          case 2:
            color = "fillRed";
            break;

          case 3:
            color = "fillOrange";
            break;

          case 4:
            color = "fillCyan";
            break;

          case 5:
            color = "fillLightBlue";
            break;

          case 6:
            color = "fillBlue";
            break;

          case 7:
            color = "fillGray";
            break;
        }

        CreateOrUpdateEventRequest request = CreateOrUpdateEventRequest(
          name: nameController.text,
          guests: guests,
          dateTime: dateController.text,
          color: color,
          theme: themeController.text,
          address: addressController.text,
        );

        var response = await eventService.create(
          token,
          widget.organizationid,
          request,
        );

        if (response.error) {
          Fluttertoast.showToast(msg: response.message!);
        } else {
          Navigator.of(context).pop(true);
        }
      },
    );
  }

  Widget _buildColorsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildColorSelectorBox(context, appTheme.purple50, 1),
        _buildColorSelectorBox(context, appTheme.red100, 2),
        _buildColorSelectorBox(context, appTheme.orange5001, 3),
        _buildColorSelectorBox(context, appTheme.cyan50, 4),
        _buildColorSelectorBox(context, appTheme.lightBlue50, 5),
        _buildColorSelectorBox(context, appTheme.blue50, 6),
        _buildColorSelectorBox(context, appTheme.gray200, 7),
      ],
    );
  }

  Widget _buildColorSelectorBox(
    BuildContext context,
    Color colorBox,
    int colorNum,
  ) {
    return GestureDetector(
      onTap: () => _selectCategory(colorNum),
      child: Container(
        height: 25.adaptSize,
        width: 25.adaptSize,
        margin: EdgeInsets.symmetric(
          vertical: 2.v,
        ),
        decoration: BoxDecoration(
          color: colorBox,
          borderRadius: BorderRadius.circular(4.h),
          border: Border.all(
            color: appTheme.black900.withOpacity(0.4),
            width: 1.h,
          ),
          boxShadow: _selectedColor == colorNum
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                  )
                ]
              : [],
        ),
      ),
    );
  }
}
