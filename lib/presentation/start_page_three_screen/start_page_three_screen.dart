import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPageThreeScreen extends StatelessWidget {
  const StartPageThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildMaskSection(context),
                  SizedBox(height: 60.v),
                  SizedBox(
                      width: 291.h,
                      child: Text(
                          "Cultivating Impactful Change, Plate by Plate",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles
                              .headlineMediumPlusJakartaSansPrimaryBold)),
                  SizedBox(height: 43.v),
                  Container(
                      width: 362.h,
                      margin: EdgeInsets.symmetric(horizontal: 33.h),
                      child: Text(
                          "Empowering communities through shared meals, where every bite creates a ripple of positive transformation.",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles
                              .bodyLargePlusJakartaSansBluegray90016)),
                  SizedBox(height: 44.v),
                  SizedBox(
                      height: 10.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: 3,
                          count: 3,
                          effect: ScrollingDotsEffect(
                              spacing: 20,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor: appTheme.blueGray10001,
                              dotHeight: 10.v,
                              dotWidth: 10.h))),
                  SizedBox(height: 41.v),
                  GestureDetector(
                      onTap: () {
                        onTapTxtSkip(context);
                      },
                      child: Text("Skip",
                          style: CustomTextStyles.titleMediumPrimaryBold)),
                  SizedBox(height: 34.v),
                  CustomElevatedButton(
                      text: "Next",
                      margin: EdgeInsets.symmetric(horizontal: 49.h),
                      buttonTextStyle: CustomTextStyles.titleMediumBold_1,
                      onPressed: () {
                        onTapNext(context);
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }

  /// Section Widget
  Widget _buildMaskSection(BuildContext context) {
    return SizedBox(
        height: 383.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.center, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse21,
              height: 383.v,
              width: 428.h,
              alignment: Alignment.center),
          CustomImageView(
              imagePath: ImageConstant.imgImage11,
              height: 383.v,
              width: 428.h,
              radius: BorderRadius.circular(267.h),
              alignment: Alignment.center)
        ]));
  }

  /// Navigates to the welcomePageScreen when the action is triggered.
  onTapTxtSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageScreen);
  }

  /// Navigates to the welcomePageScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageScreen);
  }
}
