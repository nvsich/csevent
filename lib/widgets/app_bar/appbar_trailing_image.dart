import 'package:csevent/core/app_export.dart';
import 'package:flutter/material.dart';

class AppbarTrailingImage extends StatelessWidget {
  const AppbarTrailingImage({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  final String? imagePath;

  final EdgeInsetsGeometry? margin;

  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap!.call();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: CustomImageView(
          imagePath: imagePath,
          height: 20.v,
          width: 27.h,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
