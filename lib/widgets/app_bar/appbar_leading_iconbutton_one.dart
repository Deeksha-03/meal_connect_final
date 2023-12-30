import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class AppbarLeadingIconbuttonOne extends StatelessWidget {
  AppbarLeadingIconbuttonOne({
    Key? key,
    this.imagePath,
    this.margin,
    this.onTap,
  }) : super(
          key: key,
        );

  String? imagePath;

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
        child: CustomIconButton(
          height: 31.adaptSize,
          width: 31.adaptSize,
          child: CustomImageView(
            imagePath: ImageConstant.imgUser,
          ),
        ),
      ),
    );
  }
}
