import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_icon_button.dart';

class ForgotPasswordInputScreen extends StatelessWidget {
  const ForgotPasswordInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 44.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 34.h),
                              child: Text("Forgot Password",
                                  style: CustomTextStyles
                                      .headlineMediumPlusJakartaSansBluegray900)),
                          SizedBox(height: 19.v),
                          Container(
                              width: 327.h,
                              margin: EdgeInsets.only(left: 34.h, right: 66.h),
                              child: Text(
                                  "Provide your phone number (or) email address for which you want to reset your password",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleSmallGray500_1)),
                          SizedBox(height: 57.v),
                          Padding(
                              padding: EdgeInsets.only(left: 51.h),
                              child: Text("Phone Number (or) Email",
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 12.v),
                          _buildForm(context),
                          SizedBox(height: 268.v),
                          _buildRequestCode(context)
                        ])))));
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

  /// Section Widget
  Widget _buildForm(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Container(
            width: 360.h,
            margin: EdgeInsets.symmetric(horizontal: 33.h),
            padding: EdgeInsets.symmetric(horizontal: 29.h, vertical: 14.v),
            decoration: AppDecoration.outlinePrimary1
                .copyWith(borderRadius: BorderRadiusStyle.circleBorder26),
            child: SizedBox(
                height: 22.v,
                child: VerticalDivider(
                    width: 1.h, thickness: 1.v, color: appTheme.blue600))));
  }

  /// Section Widget
  Widget _buildRequestCode(BuildContext context) {
    return SizedBox(
        height: 319.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(left: 49.h, top: 90.v, right: 49.h),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 103.h, vertical: 15.v),
                        decoration: AppDecoration.fillBlue.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder26),
                        child: Text("Request Code",
                            style: theme.textTheme.titleMedium)),
                    SizedBox(height: 30.v),
                    Text("Cancel", style: CustomTextStyles.titleMediumBlue600)
                  ]))),
          Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: () {
                    onTapKeyboard(context);
                  },
                  child: Container(
                      height: 319.v,
                      width: double.maxFinite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.h, vertical: 8.v),
                      decoration: AppDecoration.fillGray,
                      child: Stack(alignment: Alignment.topCenter, children: [
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 1.h, bottom: 76.v),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CustomIconButton(
                                                height: 47.v,
                                                width: 46.h,
                                                padding: EdgeInsets.all(5.h),
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .outlineBlack,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgShiftOff)),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 312.h),
                                                child: CustomIconButton(
                                                    height: 46.adaptSize,
                                                    width: 46.adaptSize,
                                                    padding:
                                                        EdgeInsets.all(5.h),
                                                    decoration:
                                                        IconButtonStyleHelper
                                                            .outlineBlack,
                                                    child: CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgIcon)))
                                          ]),
                                      SizedBox(height: 12.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 95.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.h,
                                                    vertical: 10.v),
                                                decoration: AppDecoration
                                                    .outlineBlack
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("123",
                                                    style: theme
                                                        .textTheme.bodyLarge)),
                                            Container(
                                                width: 199.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 30.h,
                                                    vertical: 12.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("space",
                                                    style: theme
                                                        .textTheme.bodyLarge)),
                                            Container(
                                                width: 95.h,
                                                margin:
                                                    EdgeInsets.only(left: 7.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 25.h,
                                                    vertical: 11.v),
                                                decoration: AppDecoration
                                                    .outlineBlack
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("return",
                                                    style: theme
                                                        .textTheme.bodyLarge))
                                          ])
                                    ]))),
                        Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: EdgeInsets.only(left: 1.h),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 35.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 9.h,
                                                    vertical: 5.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("Q",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.all(7.h),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("W",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("E",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 5.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("R",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12.h,
                                                    vertical: 5.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("T",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 5.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("Y",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("U",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 34.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 14.h,
                                                    vertical: 4.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("I",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 34.h,
                                                margin:
                                                    EdgeInsets.only(left: 7.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 9.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("O",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 9.h,
                                                    vertical: 5.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("P",
                                                    style: theme.textTheme
                                                        .headlineMedium))
                                          ]),
                                      SizedBox(height: 12.v),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.h),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    width: 34.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 9.h,
                                                            vertical: 7.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("A",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 34.h,
                                                    margin: EdgeInsets.only(
                                                        left: 7.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.h,
                                                            vertical: 7.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("S",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 34.h,
                                                    margin: EdgeInsets.only(
                                                        left: 7.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 9.h,
                                                            vertical: 4.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("D",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 35.h,
                                                    margin: EdgeInsets.only(
                                                        left: 7.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.h,
                                                            vertical: 4.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("F",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 35.h,
                                                    margin: EdgeInsets.only(
                                                        left: 6.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 9.h,
                                                            vertical: 5.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("G",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 35.h,
                                                    margin: EdgeInsets.only(
                                                        left: 6.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.h,
                                                            vertical: 4.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("H",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 35.h,
                                                    margin: EdgeInsets.only(
                                                        left: 6.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 12.h,
                                                            vertical: 6.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("J",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 35.h,
                                                    margin: EdgeInsets.only(
                                                        left: 6.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.h,
                                                            vertical: 4.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("K",
                                                        style: theme.textTheme
                                                            .headlineMedium)),
                                                Container(
                                                    width: 35.h,
                                                    margin: EdgeInsets.only(
                                                        left: 6.h),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.h,
                                                            vertical: 4.v),
                                                    decoration: AppDecoration
                                                        .outlineBlack900
                                                        .copyWith(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .roundedBorder5),
                                                    child: Text("L",
                                                        style: theme.textTheme
                                                            .headlineMedium))
                                              ])),
                                      SizedBox(height: 12.v),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 34.h,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("Z",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 34.h,
                                                margin:
                                                    EdgeInsets.only(left: 7.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 9.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("X",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 34.h,
                                                margin:
                                                    EdgeInsets.only(left: 7.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 9.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("C",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 7.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("V",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 9.h,
                                                    vertical: 4.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("B",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10.h,
                                                    vertical: 7.v),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("N",
                                                    style: theme.textTheme
                                                        .headlineMedium)),
                                            Container(
                                                width: 35.h,
                                                margin:
                                                    EdgeInsets.only(left: 6.h),
                                                padding: EdgeInsets.all(7.h),
                                                decoration: AppDecoration
                                                    .outlineBlack900
                                                    .copyWith(
                                                        borderRadius:
                                                            BorderRadiusStyle
                                                                .roundedBorder5),
                                                child: Text("M",
                                                    style: theme.textTheme
                                                        .headlineMedium))
                                          ])
                                    ])))
                      ]))))
        ]));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  /// Navigates to the codeVerificationScreen when the action is triggered.
  onTapKeyboard(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.codeVerificationScreen);
  }
}
