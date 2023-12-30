import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';

class CodeVerificationOneScreen extends StatelessWidget {
  const CodeVerificationOneScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 41.v),
            child: Padding(
              padding: EdgeInsets.only(
                left: 34.h,
                right: 49.h,
                bottom: 5.v,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code Verification",
                    style: CustomTextStyles
                        .headlineMediumPlusJakartaSansBluegray900,
                  ),
                  SizedBox(height: 21.v),
                  Container(
                    width: 327.h,
                    margin: EdgeInsets.only(right: 17.h),
                    child: Text(
                      "Provide your phone number (or) email address for which you want to reset your password",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.titleSmallGray500_1,
                    ),
                  ),
                  SizedBox(height: 112.v),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 41.h,
                          child: Divider(),
                        ),
                        SizedBox(
                          width: 61.h,
                          child: Divider(
                            indent: 20.h,
                          ),
                        ),
                        SizedBox(
                          width: 61.h,
                          child: Divider(
                            indent: 20.h,
                          ),
                        ),
                        SizedBox(
                          width: 61.h,
                          child: Divider(
                            indent: 20.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 21.v),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 36.h),
                      child: Text(
                        "2:00",
                        style: CustomTextStyles.labelLargeBluegray900SemiBold,
                      ),
                    ),
                  ),
                  SizedBox(height: 344.v),
                  CustomElevatedButton(
                    text: "Verify",
                    margin: EdgeInsets.only(left: 15.h),
                    buttonStyle: CustomButtonStyles.fillBlueGray,
                  ),
                  SizedBox(height: 32.v),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Send Code Again",
                      style: CustomTextStyles.titleMediumPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: double.maxFinite,
      leading: AppbarLeadingIconbuttonOne(
        imagePath: ImageConstant.imgUser,
        margin: EdgeInsets.fromLTRB(24.h, 12.v, 373.h, 12.v),
      ),
    );
  }
}
