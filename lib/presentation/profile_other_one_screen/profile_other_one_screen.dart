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
import 'package:readmore/readmore.dart';

// ignore_for_file: must_be_immutable
class ProfileOtherOneScreen extends StatelessWidget {
  ProfileOtherOneScreen({Key? key}) : super(key: key);

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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              height: 105.adaptSize,
                              width: 105.adaptSize,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 29.h, vertical: 27.v),
                              decoration: AppDecoration.fillBlueGray.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder52),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgIconParkSolid,
                                  height: 45.adaptSize,
                                  width: 45.adaptSize,
                                  alignment: Alignment.topCenter))),
                      SizedBox(height: 25.v),
                      _buildNgoName(context),
                      SizedBox(height: 31.v),
                      Padding(
                          padding: EdgeInsets.only(left: 9.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                            Padding(
                                padding: EdgeInsets.only(top: 2.v),
                                child: Column(children: [
                                  Text("4,123",
                                      style: CustomTextStyles
                                          .titleMediumPrimary_1),
                                  SizedBox(height: 3.v),
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
                          ])),
                      SizedBox(height: 39.v),
                      CustomElevatedButton(
                        alignment: Alignment.center,
                          height: 34.v,
                          width: 120.h,
                          text: "Our story",
                          buttonStyle: CustomButtonStyles.fillPrimaryTL17,
                          buttonTextStyle:
                              CustomTextStyles.labelMediumOnPrimaryContainer),
                      SizedBox(height: 51.v),
                      Text("Our story",
                          style: CustomTextStyles.titleMediumBluegray900_1),
                      SizedBox(height: 17.v),
                      SizedBox(
                          width: 352.h,
                          child: ReadMoreText(
                              "Massa eu tincidunt viverra quis scelerisque sit sollicitudin condimentum. Interdum risus at praesent dui. Interdum risus at praesent dui. Interdum risus at praesent dui. Interdum risus at praesent dui. Eget convallis vitae mauris id feugiat tortor scelerisque. ",
                              trimLines: 6,
                              colorClickableText: theme.colorScheme.secondary,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "Read more...",
                              moreStyle: CustomTextStyles
                                  .bodyLargePlusJakartaSansBluegray900,
                              lessStyle: CustomTextStyles
                                  .bodyLargePlusJakartaSansBluegray900)),
                      SizedBox(height: 5.v)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.only(left: 25.h, top: 13.v, bottom: 11.v),
            onTap: () {
              onTapUser(context);
            }),
        title:
            AppbarTitle(text: "Profile", margin: EdgeInsets.only(left: 24.h)),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgMoreVertical,
              margin: EdgeInsets.symmetric(horizontal: 38.h, vertical: 11.v))
        ]);
  }

  /// Section Widget
  Widget _buildNgoName(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: CustomCheckboxButton(
            alignment: Alignment.center,
            width: 131.h,
            text: "NGO Name",
            value: ngoName,
            isRightCheck: true,
            onChange: (value) {
              ngoName = value;
            }));
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
        return AppRoutes.ngoOrderListPage;
      case BottomBarEnum.Ngo:
        return "/";
      case BottomBarEnum.Notification:
        return "/";
      case BottomBarEnum.Profile:
        return "/";
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

  /// Navigates to the ngoOrderListContainerScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.ngoOrderListContainerScreen);
  }
}
