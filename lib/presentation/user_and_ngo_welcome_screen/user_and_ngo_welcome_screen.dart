import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';

class UserAndNgoWelcomeScreen extends StatelessWidget {
  const UserAndNgoWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 59.v),
                child: Column(children: [
                  Spacer(flex: 37),
                  CustomImageView(
                      imagePath: ImageConstant.imgGroup2180,
                      height: 188.v,
                      width: 194.h),
                  SizedBox(height: 18.v),
                  Container(
                      width: 321.h,
                      margin: EdgeInsets.only(left: 29.h, right: 32.h),
                      child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: "Welcome to MealConnect\n",
                                style:
                                    CustomTextStyles.headlineSmallSemiBold_1),
                            TextSpan(
                                text: "where food meets purpose!",
                                style: CustomTextStyles.headlineSmallCyan900)
                          ]),
                          textAlign: TextAlign.center)),
                  SizedBox(height: 32.v),
                  SizedBox(
                      width: 379.h,
                      child: Text(
                          "JOIN US ON A MISSION TO COMBAT HUNGER AND ELIMINATE FOOD WASTE. \nTOGETHER, WE CAN MAKE A DIFFERENCE- ONE MEAL AT A TIME.",
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.titleMediumGray700
                              .copyWith(height: 1.38))),
                  Spacer(flex: 62),
                  CustomElevatedButton(
                      text: "Continue",
                      margin: EdgeInsets.symmetric(horizontal: 26.h),
                      onPressed: () {
                        onTapContinue(context);
                      })
                ]))));
  }

  /// Navigates to the homePageExtendedOneScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageExtendedOneScreen);
  }
}
