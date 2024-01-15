import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';

class WelcomePageScreen extends StatelessWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 34.h),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgUndrawShowing,
                      height: 289.v,
                      width: 354.h),
                  SizedBox(height: 41.v),
                  Text("LET’S GET GOING!",
                      style: theme.textTheme.headlineSmall),
                  SizedBox(height: 62.v),
                  CustomElevatedButton(
                      text: "Sign up ",
                      margin: EdgeInsets.only(left: 16.h, right: 12.h),
                      buttonTextStyle: theme.textTheme.titleLarge!,
                      onPressed: () {
                        onTapSignUp(context);
                      }),
                  SizedBox(height: 58.v),
                  Text("OR", style: CustomTextStyles.titleMediumPrimaryBold),
                  SizedBox(height: 75.v),
                  GestureDetector(
                      onTap: () {
                        onTapTxtAlreadyhavean(context);
                      },
                      child: SizedBox(
                          width: 167.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Already have an account? \n",
                                    style:
                                        CustomTextStyles.titleSmallBlack900_3),
                                TextSpan(
                                    text: "Sign in",
                                    style: CustomTextStyles
                                        .titleSmallPrimaryBold_2)
                              ]),
                              textAlign: TextAlign.center))),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: double.maxFinite,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.fromLTRB(24.h, 12.v, 373.h, 12.v),
            onTap: () {
              onTapUser(context);
            }));
  }

  /// Navigates to the startPageThreeScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.startPageThreeScreen);
  }

  /// Navigates to the welcomePageOneScreen when the action is triggered.
  onTapSignUp(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageOneScreen);
  }

  /// Navigates to the signInDisabledScreen when the action is triggered.
  onTapTxtAlreadyhavean(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInDisabledScreen);
  }
}
