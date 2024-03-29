import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title_image.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';

class WelcomePageOneScreen extends StatelessWidget {
  const WelcomePageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 31.h, vertical: 6.v),
                child: Column(children: [
                  _buildWelcomePageOneStack(context),
                  Spacer(flex: 29),
                  SizedBox(
                      width: 157.h,
                      child: Text("WHO ARE YOU?",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.headlineLargeExtraBold)),
                  Spacer(flex: 33),
                  CustomOutlinedButton(
                      height: 62.v,
                      text: "CONTRIBUTOR",
                      margin: EdgeInsets.only(left: 15.h, right: 9.h),
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 19.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgThumbsup,
                              height: 29.v,
                              width: 34.h)),
                      buttonStyle: CustomButtonStyles.outlineBlueGrayTL10,
                      buttonTextStyle: CustomTextStyles.titleMediumBlack900,
                      onPressed: () {
                        onTapCONTRIBUTOR(context);
                      }),
                  SizedBox(height: 43.v),
                  CustomOutlinedButton(
                      height: 62.v,
                      text: "NGO",
                      margin: EdgeInsets.only(left: 15.h, right: 9.h),
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 25.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgLock,
                              height: 25.v,
                              width: 32.h)),
                      buttonStyle: CustomButtonStyles.outlineBlueGrayTL10,
                      buttonTextStyle: CustomTextStyles.titleMediumBlack900,
                      onPressed: () {
                        onTapNGO(context);
                      }),
                  Spacer(flex: 36)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 55.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.only(left: 24.h, top: 12.v, bottom: 12.v),
            onTap: () {
              onTapUser(context);
            }),
        centerTitle: true,
        title: AppbarTitleImage(imagePath: ImageConstant.imgVector));
  }

  /// Section Widget
  Widget _buildWelcomePageOneStack(BuildContext context) {
    return SizedBox(
        height: 194.v,
        width: 363.h,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgImage496,
              height: 185.v,
              width: 363.h,
              alignment: Alignment.bottomCenter),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 100.h, right: 96.h, bottom: 41.v),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgVectorBlue600,
                              height: 21.v,
                              width: 24.h),
                          CustomImageView(
                              imagePath: ImageConstant.imgVectorBlue600,
                              height: 9.v,
                              width: 10.h,
                              margin: EdgeInsets.symmetric(vertical: 6.v))
                        ]),
                    SizedBox(height: 10.v),
                    CustomImageView(
                        imagePath: ImageConstant.imgVectorBlue600,
                        height: 4.v,
                        width: 5.h)
                  ]))),
          CustomImageView(
              imagePath: ImageConstant.imgVectorBlue60016x22,
              height: 16.v,
              width: 22.h,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 107.h)),
          CustomImageView(
              imagePath: ImageConstant.imgVector,
              height: 14.v,
              width: 17.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 107.h, top: 11.v))
        ]));
  }

  /// Navigates to the welcomePageScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageScreen);
  }

  /// Navigates to the signUpScreen when the action is triggered.
  onTapCONTRIBUTOR(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpScreen);
  }

  /// Navigates to the ngoVerificationPageScreen when the action is triggered.
  onTapNGO(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.ngoVerificationPageScreen);
  }
}
