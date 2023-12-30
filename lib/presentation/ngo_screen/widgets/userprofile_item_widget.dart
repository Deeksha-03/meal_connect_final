import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  UserprofileItemWidget({
    Key? key,
    this.onTapUserProfile,
  }) : super(
          key: key,
        );

  VoidCallback? onTapUserProfile;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapUserProfile!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.v),
        decoration: AppDecoration.outlineBluegray10002.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgContrast,
              height: 67.v,
              width: 70.h,
              margin: EdgeInsets.only(top: 1.v),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NGO - 1",
                    style: CustomTextStyles.titleSmallSemiBold_1,
                  ),
                  SizedBox(height: 9.v),
                  SizedBox(
                    width: 224.h,
                    child: Text(
                      "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelMediumMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
