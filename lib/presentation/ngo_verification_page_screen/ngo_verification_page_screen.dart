import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class NgoVerificationPageScreen extends StatelessWidget {
  NgoVerificationPageScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController registrationnumberController = TextEditingController();

  TextEditingController dateController = TextEditingController();

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
                        EdgeInsets.symmetric(horizontal: 27.h, vertical: 8.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 46.v),
                          Container(
                              width: 329.h,
                              margin: EdgeInsets.only(left: 7.h, right: 37.h),
                              child: Text(
                                  "Provide your name and registration number as per NGO Darpan for verification.",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.titleSmallGray500_1)),
                          SizedBox(height: 40.v),
                          Text("NGO detail",
                              style: CustomTextStyles.titleMediumBluegray900_1),
                          SizedBox(height: 40.v),
                          Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Text("NGO name",
                                        style: theme.textTheme.titleSmall)),
                                Padding(
                                    padding:
                                        EdgeInsets.only(left: 2.h, bottom: 3.v),
                                    child: Text("*",
                                        style: theme.textTheme.bodyMedium))
                              ])),
                          SizedBox(height: 9.v),
                          Padding(
                              padding: EdgeInsets.only(right: 14.h),
                              child: CustomTextFormField(
                                  controller: nameController,
                                  hintText: "Enter NGO’s name as registered")),
                          SizedBox(height: 46.v),
                          Padding(
                              padding: EdgeInsets.only(left: 18.h),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(top: 6.v),
                                        child: Text("Registration No",
                                            style: theme.textTheme.titleSmall)),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 5.h, bottom: 7.v),
                                        child: Text("*",
                                            style: theme.textTheme.bodyMedium))
                                  ])),
                          SizedBox(height: 7.v),
                          Padding(
                              padding: EdgeInsets.only(right: 14.h),
                              child: CustomTextFormField(
                                  controller: registrationnumberController,
                                  hintText: "Registration number ",
                                  textInputType: TextInputType.number)),
                          SizedBox(height: 48.v),
                          _buildDonationExpired(context),
                          SizedBox(height: 66.v),
                          CustomElevatedButton(
                              width: 210.h,
                              text: "Submit & Verify",
                              margin: EdgeInsets.only(left: 62.h),
                              buttonStyle: CustomButtonStyles.fillBlueGray,
                              buttonTextStyle:
                                  CustomTextStyles.titleMediumMedium,
                              onPressed: () {
                                onTapSubmitVerify(context);
                              }),
                          Spacer(),
                          SizedBox(
                              width: 249.h,
                              child: Divider(
                                  color: appTheme.blueGray900, indent: 105.h))
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 55.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.only(left: 24.h, top: 7.v, bottom: 17.v),
            onTap: () {
              onTapUser(context);
            }),
        title: AppbarTitle(
            text: "Verify using NGO darpan",
            margin: EdgeInsets.only(left: 25.h)));
  }

  /// Section Widget
  Widget _buildDonationExpired(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 14.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text("State", style: theme.textTheme.titleSmall)),
                Padding(
                    padding: EdgeInsets.only(bottom: 3.v),
                    child: Text("*", style: theme.textTheme.bodyMedium))
              ])),
          SizedBox(height: 9.v),
          CustomTextFormField(
              controller: dateController,
              hintText: "Donation Expired Date",
              textInputAction: TextInputAction.done)
        ]));
  }

  /// Navigates to the welcomePageOneScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageOneScreen);
  }

  /// Navigates to the profileCreationScreen when the action is triggered.
  onTapSubmitVerify(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileCreationScreen);
  }
}
