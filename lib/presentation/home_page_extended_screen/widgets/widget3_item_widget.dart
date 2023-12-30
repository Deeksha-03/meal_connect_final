import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

// ignore: must_be_immutable
class Widget3ItemWidget extends StatelessWidget {
  const Widget3ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: CustomImageView(
        imagePath: ImageConstant.imgImage491,
        height: 210.v,
        width: 354.h,
        radius: BorderRadius.circular(
          20.h,
        ),
      ),
    );
  }
}
