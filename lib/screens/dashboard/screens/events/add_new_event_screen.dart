import 'package:csevent/core/app_export.dart';
import 'package:csevent/widgets/app_bar/appbar_leading_image.dart';
import 'package:csevent/widgets/app_bar/appbar_subtitle.dart';
import 'package:csevent/widgets/app_bar/custom_app_bar_image.dart';
import 'package:csevent/widgets/custom_elevated_button.dart';
import 'package:csevent/widgets/custom_pin_code_text_field.dart';
import 'package:csevent/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class AddNewEventScreen extends StatefulWidget {
  const AddNewEventScreen({super.key});

  @override
  State<AddNewEventScreen> createState() => _AddNewEventScreenState();
}

class _AddNewEventScreenState extends State<AddNewEventScreen> {
  TextEditingController nameController = TextEditingController();

  TextEditingController themeController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController guestsController = TextEditingController();

  Color selectedColor = Colors.red;

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

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
              //_buildColors(),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildSaveButton(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 45.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgBackIconButton,
        margin: EdgeInsets.only(
          left: 18.h,
          top: 17.v,
          bottom: 18.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(text: "Добавить мероприятие"),
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
      controller: nameController,
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

  Widget _buildColors(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedColor = colors[index];
            });
          },
          child: Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: selectedColor == colors[index]
                    ? Colors.black
                    : Colors.transparent,
                width: 3,
              ),
            ),
          ),
        );
      },
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
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
