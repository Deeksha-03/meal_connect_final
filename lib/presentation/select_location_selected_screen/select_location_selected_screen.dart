import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';

class SelectLocationSelectedScreen extends StatelessWidget {
  const SelectLocationSelectedScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 27.h,
            vertical: 52.v,
          ),
          child: Column(
            children: [
              Text(
                "Choose your location to see the NGO’s nearby",
                style: CustomTextStyles.titleMediumBluegray900Medium,
              ),
              Spacer(
                flex: 34,
              ),
              _buildSelectLocationColumn(context),
              Spacer(
                flex: 65,
              ),
              SizedBox(height: 6.v),
              CustomElevatedButton(
                text: "Continue",
                margin: EdgeInsets.symmetric(horizontal: 22.h),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 55.h,
      leading: AppbarLeadingIconbuttonOne(
        imagePath: ImageConstant.imgUser,
        margin: EdgeInsets.only(
          left: 24.h,
          top: 12.v,
          bottom: 12.v,
        ),
      ),
      title: AppbarTitle(
        text: "Location",
        margin: EdgeInsets.only(left: 25.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildSelectLocationColumn(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomElevatedButton(
                  height: 80.v,
                  text: "Basavangudi",
                  margin: EdgeInsets.only(right: 21.h),
                  buttonStyle: CustomButtonStyles.fillPrimaryTL10,
                  buttonTextStyle: CustomTextStyles.titleMediumBold,
                ),
              ),
              Expanded(
                child: CustomOutlinedButton(
                  height: 80.v,
                  text: "Indiranagar",
                  margin: EdgeInsets.only(left: 21.h),
                  buttonStyle: CustomButtonStyles.outlinePrimaryTL10,
                  buttonTextStyle: CustomTextStyles.titleMediumPrimaryBold16,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.v),
          _buildSelectLocationRow(
            context,
            girinagarText: "JP nagar",
            malleshwaramText: "Kormangala",
          ),
          SizedBox(height: 40.v),
          _buildSelectLocationRow(
            context,
            girinagarText: "Girinagar",
            malleshwaramText: "Malleshwaram",
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildSelectLocationRow(
    BuildContext context, {
    required String girinagarText,
    required String malleshwaramText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 21.h),
            padding: EdgeInsets.all(25.h),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 5.v),
                Text(
                  girinagarText,
                  style: CustomTextStyles.titleMediumPrimaryBold16.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 21.h),
            padding: EdgeInsets.symmetric(
              horizontal: 14.h,
              vertical: 26.v,
            ),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder12,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 2.v),
                Text(
                  malleshwaramText,
                  style: CustomTextStyles.titleMediumPrimaryBold16.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
