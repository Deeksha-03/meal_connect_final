import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:meal_connect/widgets/custom_checkbox_button.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class ProfileOtherTwoScreen extends StatelessWidget {
  ProfileOtherTwoScreen({Key? key}) : super(key: key);

  bool ngoName = false;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 40.v),
                child: Column(children: [
                  Container(
                      height: 105.adaptSize,
                      width: 105.adaptSize,
                      padding: EdgeInsets.symmetric(
                          horizontal: 29.h, vertical: 27.v),
                      decoration: AppDecoration.fillBlueGray.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder52),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgIconParkSolid,
                          height: 45.adaptSize,
                          width: 45.adaptSize,
                          alignment: Alignment.topCenter)),
                  SizedBox(height: 25.v),
                  _buildNgoName(context),
                  SizedBox(height: 30.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 79.h),
                          child: Row(children: [
                            Padding(
                                padding: EdgeInsets.only(bottom: 3.v),
                                child: Column(children: [
                                  Text("4,123",
                                      style: CustomTextStyles
                                          .titleMediumPrimary_1),
                                  Text("Contributions",
                                      style: theme.textTheme.labelLarge)
                                ])),
                            Padding(
                                padding: EdgeInsets.only(left: 20.h),
                                child: SizedBox(
                                    height: 45.v,
                                    child: VerticalDivider(
                                        width: 1.h,
                                        thickness: 1.v,
                                        color: appTheme.blueGray10002))),
                            Padding(
                                padding: EdgeInsets.only(left: 28.h),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Text("67.2 K",
                                              style: CustomTextStyles
                                                  .titleMediumPrimary_1)),
                                      SizedBox(height: 4.v),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text("Followers",
                                              style:
                                                  theme.textTheme.labelLarge))
                                    ]))
                          ]))),
                  SizedBox(height: 48.v),
                  CustomOutlinedButton(
                      text: "Follow ",
                      margin: EdgeInsets.symmetric(horizontal: 13.h),
                      leftIcon: Container(
                          margin: EdgeInsets.only(right: 17.h),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgUserplus,
                              height: 24.adaptSize,
                              width: 24.adaptSize)),
                      buttonStyle: CustomButtonStyles.outlinePrimaryTL28,
                      buttonTextStyle: CustomTextStyles.titleMediumPrimary),
                  SizedBox(height: 59.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(right: 97.h),
                          child: Row(children: [
                            CustomOutlinedButton(
                                height: 34.v, width: 120.h, text: "Our story"),
                            CustomElevatedButton(
                                height: 34.v,
                                width: 120.h,
                                text: "Connect",
                                margin: EdgeInsets.only(left: 19.h),
                                buttonStyle: CustomButtonStyles.fillPrimaryTL17,
                                buttonTextStyle: CustomTextStyles
                                    .labelMediumOnPrimaryContainer,
                                onPressed: () {
                                  onTapConnect(context);
                                })
                          ]))),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 55.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.only(left: 24.h, top: 12.v, bottom: 12.v),
            onTap: () {
              onTapUser(context);
            }),
        title:
            AppbarTitle(text: "Profile", margin: EdgeInsets.only(left: 25.h)),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgMoreVertical,
              margin: EdgeInsets.symmetric(horizontal: 38.h, vertical: 11.v))
        ]);
  }

  /// Section Widget
  Widget _buildNgoName(BuildContext context) {
    return CustomCheckboxButton(
        width: 136.h,
        text: "NGO Name",
        value: ngoName,
        isRightCheck: true,
        onChange: (value) {
          ngoName = value;
        });
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
   switch (type) {
    case BottomBarEnum.Explore:
     return AppRoutes.homePageExtendedScreen;
    case BottomBarEnum.Ngo:
     return AppRoutes.ngoOrderListPage;
    case BottomBarEnum.Notification:
     return AppRoutes.notificationsNoNotiScreen;
    case BottomBarEnum.Profile:
     return AppRoutes.profileUserScreen;
    default:
     return "/";
   }
  }
  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ngoOrderListPage:
        return NgoOrderListPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the profileFollowedScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileFollowedScreen);
  }

  /// Navigates to the checkoutPageTabContainerScreen when the action is triggered.
  onTapConnect(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.checkoutPageTabContainerScreen);
  }
}
