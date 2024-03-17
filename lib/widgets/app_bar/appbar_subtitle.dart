import 'package:csevent/core/app_export.dart';
import 'package:flutter/material.dart';

class AppbarSubtitle extends StatelessWidget {
  const AppbarSubtitle({
    Key? key,
    required this.text,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          style: CustomTextStyles.titleLargeBlack900.copyWith(
            color: appTheme.black900.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
