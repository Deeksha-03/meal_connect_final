import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordInvalidScreen extends StatelessWidget {
  ForgotPasswordInvalidScreen({Key? key}) : super(key: key);

  TextEditingController phoneNumberController = TextEditingController();

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
                    padding:
                        EdgeInsets.symmetric(horizontal: 11.h, vertical: 44.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 23.h),
                              child: Text("Forgot Password",
                                  style: CustomTextStyles
                                      .headlineMediumPlusJakartaSansBluegray900)),
                          SizedBox(height: 19.v),
                          Container(
                              width: 327.h,
                              margin: EdgeInsets.only(left: 23.h, right: 55.h),
                              child: Text(
                                  "Provide your email address for which you want to reset your password",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleSmallGray500_1)),
                          SizedBox(height: 57.v),
                          Padding(
                              padding: EdgeInsets.only(left: 40.h),
                              child: Text("Email Id",
                                  style: CustomTextStyles.titleSmallOnPrimary)),
                          SizedBox(height: 12.v),
                          _buildPhoneNumberRow(context),
                          Spacer(),
                          CustomElevatedButton(
                              text: "Request Code",
                              margin: EdgeInsets.symmetric(horizontal: 38.h),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              alignment: Alignment.center),
                          SizedBox(height: 30.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Cancel",
                                  style: CustomTextStyles.titleMediumBlue600)),
                          SizedBox(height: 24.v)
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
  Widget _buildPhoneNumberRow(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Padding(
            padding: EdgeInsets.only(left: 23.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        CustomTextFormField(
                            controller: phoneNumberController,
                            hintText: "Enter your email",
                            hintStyle: CustomTextStyles.titleSmallBluegray10002,
                            textInputAction: TextInputAction.done,
                            textInputType: TextInputType.emailAddress),
                        SizedBox(height: 14.v),
                        Padding(
                            padding: EdgeInsets.only(left: 23.h),
                            child: Text("Email is invalid",
                                style: CustomTextStyles.labelLargeOnPrimary))
                      ])),
                  CustomImageView(
                      imagePath: ImageConstant.imgVideoCamera,
                      height: 13.adaptSize,
                      width: 13.adaptSize,
                      margin:
                          EdgeInsets.only(left: 8.h, top: 21.v, bottom: 48.v))
                ])));
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }
}
