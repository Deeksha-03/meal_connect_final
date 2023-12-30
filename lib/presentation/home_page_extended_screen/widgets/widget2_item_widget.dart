import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

// ignore: must_be_immutable
class Widget2ItemWidget extends StatelessWidget {
  const Widget2ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: 220.v,
        width: 355.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgImage492,
              height: 220.v,
              width: 355.h,
              radius: BorderRadius.circular(
                20.h,
              ),
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgImage499,
              height: 220.v,
              width: 355.h,
              radius: BorderRadius.circular(
                110.h,
              ),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
