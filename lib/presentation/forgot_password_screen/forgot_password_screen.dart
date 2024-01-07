import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);

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
                        EdgeInsets.symmetric(horizontal: 32.h, vertical: 44.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: Text("Forgot Password",
                                  style: CustomTextStyles
                                      .headlineMediumPlusJakartaSansBluegray900)),
                          SizedBox(height: 19.v),
                          Container(
                              width: 327.h,
                              margin: EdgeInsets.only(left: 2.h, right: 34.h),
                              child: Text(
                                  "Provide your phone number (or) email address for which you want to reset your password",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleSmallGray500_1)),
                          SizedBox(height: 57.v),
                          Padding(
                              padding: EdgeInsets.only(left: 19.h),
                              child: Text("Phone Number (or) Email",
                                  style: theme.textTheme.titleSmall)),
                          SizedBox(height: 12.v),
                          Padding(
                              padding: EdgeInsets.only(left: 2.h),
                              child: CustomTextFormField(
                                  controller: phoneNumberController,
                                  hintText: "Enter phone numberr (or) email",
                                  hintStyle:
                                      CustomTextStyles.titleSmallBluegray10002,
                                  textInputAction: TextInputAction.done,
                                  textInputType: TextInputType.emailAddress)),
                          Spacer(),
                          CustomElevatedButton(
                              text: "Request Code",
                              margin: EdgeInsets.symmetric(horizontal: 17.h),
                              alignment: Alignment.center),
                          SizedBox(height: 30.v),
                          Align(
                              alignment: Alignment.center,
                              child: Text("Cancel",
                                  style: CustomTextStyles.titleMediumPrimary)),
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

  /// Navigates to the signInDisabledScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInDisabledScreen);
  }
}
