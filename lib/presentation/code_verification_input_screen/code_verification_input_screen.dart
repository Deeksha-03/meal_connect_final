import '../code_verification_input_screen/widgets/stack_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_pin_code_text_field.dart';

class CodeVerificationInputScreen extends StatelessWidget {
  const CodeVerificationInputScreen({Key? key})
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
            horizontal: 6.h,
            vertical: 39.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.v),
              Padding(
                padding: EdgeInsets.only(left: 27.h),
                child: Text(
                  "Code Verification",
                  style:
                      CustomTextStyles.headlineMediumPlusJakartaSansBluegray900,
                ),
              ),
              SizedBox(height: 21.v),
              Container(
                width: 327.h,
                margin: EdgeInsets.only(
                  left: 27.h,
                  right: 59.h,
                ),
                child: Text(
                  "Provide your phone number (or) email address for which you want to reset your password",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.titleSmallGray500_1,
                ),
              ),
              SizedBox(height: 73.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 89.h,
                  right: 97.h,
                ),
                child: CustomPinCodeTextField(
                  context: context,
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 20.v),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 79.h),
                  child: Text(
                    "2:00",
                    style: CustomTextStyles.labelLargeBluegray900SemiBold,
                  ),
                ),
              ),
              Spacer(),
              _buildVerrify(context),
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

  /// Section Widget
  Widget _buildVerrify(BuildContext context) {
    return SizedBox(
      height: 237.v,
      width: 413.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 41.h,
                right: 41.h,
                bottom: 27.v,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 136.h,
                      vertical: 15.v,
                    ),
                    decoration: AppDecoration.fillBlue.copyWith(
                      borderRadius: BorderRadiusStyle.circleBorder26,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 2.v),
                        Text(
                          "Verrify",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.v),
                  Text(
                    "Send Code Again",
                    style: CustomTextStyles.titleMediumBlue600,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 237.v,
              width: 413.h,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  _buildSixStack(
                    context,
                    dynamicText: "DEF",
                    dynamicText1: "3",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 61.v),
                    child: _buildSixStack(
                      context,
                      dynamicText: "MNO",
                      dynamicText1: "6",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 60.v),
                    child: _buildSixStack(
                      context,
                      dynamicText: "WXYZ",
                      dynamicText1: "9",
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 54.v,
                              width: 133.h,
                              child: Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 52.v,
                                      width: 133.h,
                                      decoration: BoxDecoration(
                                        color: theme
                                            .colorScheme.onPrimaryContainer,
                                        borderRadius: BorderRadius.circular(
                                          5.h,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: appTheme.black900
                                                .withOpacity(0.3),
                                            spreadRadius: 2.h,
                                            blurRadius: 2.h,
                                            offset: Offset(
                                              0,
                                              1.14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 52.h),
                                      child: Text(
                                        "1",
                                        style: CustomTextStyles
                                            .headlineMediumRegular,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: _buildSixStack(
                                context,
                                dynamicText: "ABC",
                                dynamicText1: "2",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7.v),
                        Padding(
                          padding: EdgeInsets.only(right: 93.h),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 55.v,
                              crossAxisCount: 2,
                              mainAxisSpacing: 6.h,
                              crossAxisSpacing: 6.h,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return StackItemWidget();
                            },
                          ),
                        ),
                        SizedBox(height: 7.v),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 33.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.img,
                                  height: 15.v,
                                  width: 55.h,
                                  margin: EdgeInsets.only(
                                    top: 14.v,
                                    bottom: 21.v,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 51.h),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 50.h,
                                    vertical: 5.v,
                                  ),
                                  decoration:
                                      AppDecoration.outlineBlack9002.copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder5,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 8.v),
                                      Text(
                                        "0",
                                        style: CustomTextStyles
                                            .headlineMediumGray800,
                                      ),
                                    ],
                                  ),
                                ),
                                CustomImageView(
                                  imagePath: ImageConstant.imgDelete,
                                  height: 36.adaptSize,
                                  width: 36.adaptSize,
                                  margin: EdgeInsets.only(
                                    left: 56.h,
                                    top: 6.v,
                                    bottom: 9.v,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSixStack(
    BuildContext context, {
    required String dynamicText,
    required String dynamicText1,
  }) {
    return SizedBox(
      height: 54.v,
      width: 133.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 43.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.outlineBlack9001.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder5,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 19.v),
                  Text(
                    dynamicText,
                    style:
                        CustomTextStyles.labelMediumSFProTextBlack900.copyWith(
                      color: appTheme.black900,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 50.h),
              child: Text(
                dynamicText1,
                style: CustomTextStyles.headlineMediumRegular.copyWith(
                  color: appTheme.black900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
