import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';

class SuccessfulOneScreen extends StatelessWidget {
  const SuccessfulOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 49.h, vertical: 59.v),
                child: Column(children: [
                  Spacer(flex: 27),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup2180,
                      height: 188.v,
                      width: 194.h,
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 62.h)),
                  SizedBox(height: 33.v),
                  Text("Profile Created", style: theme.textTheme.headlineLarge),
                  Spacer(flex: 72),
                  CustomElevatedButton(
                      text: "Continue",
                      onPressed: () {
                        onTapContinue(context);
                      })
                ]))));
  }

  /// Navigates to the ngoOrderListContainerScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.ngoOrderListContainerScreen);
  }
}
