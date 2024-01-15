import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

class StartupPageScreen extends StatelessWidget {
  const StartupPageScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 30.h,
            vertical: 129.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 82.v),
              _buildWidgetStack(context),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgClose,
                height: 62.adaptSize,
                width: 62.adaptSize,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildWidgetStack(BuildContext context) {
    return SizedBox(
      height: 379.v,
      width: 363.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage496,
            height: 185.v,
            width: 363.h,
            alignment: Alignment.center,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgGroup1,
            height: 379.v,
            width: 296.h,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.startPageTwoScreen);
  }
}
