import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title_image.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignInInvalidStageScreen extends StatelessWidget {
  SignInInvalidStageScreen({Key? key}) : super(key: key);

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 34.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.center,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 124.v,
                                        width: 127.h,
                                        child: Stack(
                                            alignment: Alignment.bottomLeft,
                                            children: [
                                              CustomImageView(
                                                  imagePath:
                                                      ImageConstant.imgNavNgo,
                                                  height: 100.v,
                                                  width: 105.h,
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  margin: EdgeInsets.only(
                                                      right: 7.h, bottom: 6.v)),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgVectorBlue60019x19,
                                                  height: 19.adaptSize,
                                                  width: 19.adaptSize,
                                                  alignment:
                                                      Alignment.bottomLeft),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgVectorBlue60016x22,
                                                  height: 15.v,
                                                  width: 18.h,
                                                  alignment:
                                                      Alignment.topRight),
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgVectorBlue60013x14,
                                                  height: 13.v,
                                                  width: 14.h,
                                                  alignment: Alignment.topLeft,
                                                  margin: EdgeInsets.only(
                                                      left: 5.h, top: 10.v))
                                            ])),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgVectorBlue60019x19,
                                        height: 8.adaptSize,
                                        width: 8.adaptSize,
                                        margin: EdgeInsets.only(
                                            top: 110.v, bottom: 5.v))
                                  ])),
                          SizedBox(height: 9.v),
                          CustomImageView(
                              imagePath: ImageConstant.imgVectorBlue60019x19,
                              height: 4.adaptSize,
                              width: 4.adaptSize,
                              alignment: Alignment.center),
                          SizedBox(height: 38.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Start your journey",
                                  style: theme.textTheme.headlineSmall)),
                          SizedBox(height: 60.v),
                          Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 3.v),
                                    child: Text("Username (or) email",
                                        style: CustomTextStyles
                                            .titleSmallOnPrimary)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 4.h, bottom: 4.v),
                                    child: Text("*",
                                        style: theme.textTheme.bodyMedium))
                              ])),
                          SizedBox(height: 8.v),
                          CustomTextFormField(
                              controller: userNameController,
                              hintText: "Enter your username(or)email",
                              textInputType: TextInputType.emailAddress),
                          SizedBox(height: 8.v),
                          Padding(
                              padding: EdgeInsets.only(left: 23.h),
                              child: Text("Username (or) email is invalid",
                                  style: theme.textTheme.labelSmall)),
                          SizedBox(height: 29.v),
                          Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Text("Password",
                                        style: CustomTextStyles
                                            .titleSmallOnPrimary)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 3.h, bottom: 3.v),
                                    child: Text("*",
                                        style: theme.textTheme.bodyMedium))
                              ])),
                          SizedBox(height: 9.v),
                          CustomTextFormField(
                              controller: passwordController,
                              hintText: "Enter your password",
                              textInputAction: TextInputAction.done,
                              textInputType: TextInputType.visiblePassword,
                              suffix: Container(
                                  margin: EdgeInsets.fromLTRB(
                                      30.h, 13.v, 27.h, 11.v),
                                  child: CustomImageView(
                                      imagePath: ImageConstant
                                          .imgAntdesigneyeinvisiblefilled,
                                      height: 28.adaptSize,
                                      width: 28.adaptSize)),
                              suffixConstraints:
                                  BoxConstraints(maxHeight: 52.v),
                              obscureText: true,
                              contentPadding: EdgeInsets.only(
                                  left: 23.h, top: 17.v, bottom: 17.v)),
                          SizedBox(height: 7.v),
                          Padding(
                              padding: EdgeInsets.only(left: 23.h),
                              child: Text("Password is invalid",
                                  style: theme.textTheme.labelSmall)),
                          SizedBox(height: 87.v),
                          Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    onTapTxtForgotPassword(context);
                                  },
                                  child: Text("Forgot password?",
                                      style: CustomTextStyles
                                          .titleSmallPrimaryBold_1))),
                          SizedBox(height: 24.v),
                          CustomElevatedButton(
                              text: "Sign In",
                              margin: EdgeInsets.symmetric(horizontal: 15.h),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              alignment: Alignment.center),
                          SizedBox(height: 19.v),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount(context);
                              },
                              child: Container(
                                  width: 153.h,
                                  margin: EdgeInsets.only(left: 97.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "Don’t have an account?\n ",
                                            style: CustomTextStyles
                                                .titleSmallBlack900_3),
                                        TextSpan(
                                            text: "Sign",
                                            style: CustomTextStyles
                                                .titleSmallPrimaryBold_2),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "up",
                                            style: CustomTextStyles
                                                .titleSmallPrimaryBold_2)
                                      ]),
                                      textAlign: TextAlign.center))),
                          SizedBox(height: 5.v)
                        ])))));
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
        title:
            AppbarTitleImage(imagePath: ImageConstant.imgVectorBlue60013x14));
  }

  /// Navigates to the signInDisabledScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInDisabledScreen);
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotPassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  /// Navigates to the welcomePageOneScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageOneScreen);
  }
}
