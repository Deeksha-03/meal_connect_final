import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';

// ignore: must_be_immutable
class DonationlistItemWidget extends StatelessWidget {
  const DonationlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomImageView(
          imagePath: ImageConstant.imgMaskGroup,
          height: 46.adaptSize,
          width: 46.adaptSize,
        ),
        Container(
          width: 168.h,
          margin: EdgeInsets.only(
            left: 17.h,
            top: 7.v,
            bottom: 7.v,
          ),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Anonymous",
                  style: CustomTextStyles.labelLargeBlack900Bold,
                ),
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: "has requested to donated food",
                  style: CustomTextStyles.labelLargeBluegray900,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        CustomOutlinedButton(
          height: 34.v,
          width: 120.h,
          text: "Pending",
          margin: EdgeInsets.only(
            left: 12.h,
            top: 5.v,
            bottom: 7.v,
          ),
          buttonStyle: CustomButtonStyles.outlinePrimary,
        ),
      ],
    );
  }
}
