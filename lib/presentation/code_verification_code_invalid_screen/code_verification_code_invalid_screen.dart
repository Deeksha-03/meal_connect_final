import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_pin_code_text_field.dart';

class CodeVerificationCodeInvalidScreen extends StatelessWidget {
  const CodeVerificationCodeInvalidScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 34.h,
            vertical: 41.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Code Verification",
                style:
                    CustomTextStyles.headlineMediumPlusJakartaSansBluegray900,
              ),
              SizedBox(height: 21.v),
              Container(
                width: 327.h,
                margin: EdgeInsets.only(right: 32.h),
                child: Text(
                  "Provide your phone number (or) email address for which you want to reset your password",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallGray500_1,
                ),
              ),
              SizedBox(height: 65.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 55.h,
                  right: 77.h,
                ),
                child: CustomPinCodeTextField(
                  context: context,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 17.v),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 55.h,
                    right: 61.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.v),
                        child: Text(
                          "Code is invalid. ",
                          style: CustomTextStyles.labelLargeOnPrimary,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.v),
                        child: Text(
                          "2:00",
                          style: CustomTextStyles.labelLargeBluegray900SemiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                text: "Verify",
                margin: EdgeInsets.symmetric(horizontal: 15.h),
                buttonStyle: CustomButtonStyles.fillBlueGray,
                alignment: Alignment.center,
              ),
              SizedBox(height: 32.v),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Send Code Again",
                  style: CustomTextStyles.titleMediumPrimary,
                ),
              ),
              SizedBox(height: 25.v),
            ],
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
