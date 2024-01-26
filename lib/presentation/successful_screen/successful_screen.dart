import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 49.h, vertical: 59.v),
                child: Column(children: [
                  Spacer(flex: 35),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup2180,
                      height: 188.v,
                      width: 194.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 62.h)),
                  SizedBox(height: 24.v),
                  Text("Verified", style: theme.textTheme.headlineLarge),
                  SizedBox(height: 47.v),
                  Container(
                      width: 319.h,
                      margin: EdgeInsets.only(left: 5.h, right: 4.h),
                      child: Text(
                          "Your credentials have been verified. Thank you for being a part of MealConnect.\nLet’s make this world a better place.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleMediumGray700
                              .copyWith(height: 1.38))),
                  Spacer(flex: 64),
                  CustomElevatedButton(
                      text: "Continue",
                      onPressed: () {
                        onTapContinue(context);
                      })
                ]))));
  }

  /// Navigates to the homePageExtendedOneScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileCreationScreen);
  }
}