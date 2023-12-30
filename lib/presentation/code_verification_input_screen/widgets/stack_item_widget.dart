import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

// ignore: must_be_immutable
class StackItemWidget extends StatelessWidget {
  const StackItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.v,
      width: 133.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 46.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 19.v),
                  Text(
                    "GHI",
                    style: CustomTextStyles.labelMediumSFProTextBlack900,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50.h),
              child: Text(
                "4",
                style: CustomTextStyles.headlineMediumRegular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
