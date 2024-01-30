import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/presentation/ngo_order_list_screen/ngo_order_list_screen.dart';
import 'package:meal_connect/presentation/notifications_no_noti_screen/notifications_no_noti_screen.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:meal_connect/widgets/custom_checkbox_button.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';
import 'package:readmore/readmore.dart';



// ignore_for_file: must_be_immutable
class ProfileOtherScreen extends StatefulWidget {
  ProfileOtherScreen({Key? key}) : super(key: key);

  @override
  _ProfileOtherScreenState createState() => _ProfileOtherScreenState();
}

class _ProfileOtherScreenState extends State<ProfileOtherScreen> {
  bool ngoName = false;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 36.h, vertical: 21.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 18.v),
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
                          padding: EdgeInsets.only(left: 79.h),
                          child: Row(children: [
                            Column(children: [
                              Text("4,123",
                                  style: CustomTextStyles.titleMediumPrimary_1),
                              SizedBox(height: 3.v),
                              Text("Contributions",
                                  style: theme.textTheme.labelLarge)
                            ]),
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
                      SizedBox(height: 47.v),
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
                          buttonTextStyle: CustomTextStyles.titleMediumPrimary,
                          onPressed: () {
                            onTapFollow(context);
                          },
                          alignment: Alignment.center),
                      SizedBox(height: 59.v),
                      Padding(
                          padding: EdgeInsets.only(right: 97.h),
                          child: Row(children: [
                            CustomElevatedButton(
                                height: 34.v,
                                width: 120.h,
                                text: "Our story",
                                buttonStyle: CustomButtonStyles.fillPrimaryTL17,
                                buttonTextStyle: CustomTextStyles
                                    .labelMediumOnPrimaryContainer),
                            CustomOutlinedButton(
                                height: 34.v,
                                width: 120.h,
                                text: "Connect",
                                margin: EdgeInsets.only(left: 19.h),
                              onPressed: () {
                                onConnect(context);
                              },
                                )

                          ])),
                      SizedBox(height: 51.v),
                      Text("Our story",
                          style: CustomTextStyles.titleMediumBluegray900_1),
                      SizedBox(height: 17.v),
                      SizedBox(
                          width: 352.h,
                          child: ReadMoreText(
                              "Massa eu tincidunt viverra quis scelerisque sit sollicitudin condimentum. Interdum risus at praesent dui. Interdum risus at praesent dui. Interdum risus at praesent dui. Interdum risus at praesent dui. Eget convallis vitae mauris id feugiat tortor scelerisque. ",
                              trimLines: 6,
                              colorClickableText: theme.colorScheme.primary,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "Read more...",
                              style: TextStyle(color: Colors.black),
                              moreStyle: CustomTextStyles
                                  .bodyLargePlusJakartaSansBluegray900,
                              lessStyle: CustomTextStyles
                                  .bodyLargePlusJakartaSansBluegray900))
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
    return CustomBottomBar(
      onTap: (BottomBarEnum type) {
        Navigator.pushNamed(
          context,
          getCurrentRoute(type),
        );
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Explore:
        return AppRoutes.ngoOrderListScreen;
      case BottomBarEnum.Ngo:
        return AppRoutes.profileOtherScreen;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationsNoNotiScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileOtherScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ngoOrderListScreen:
        return NgoOrderListScreen(); // Use the same screen for now, you might want to change it.
      case AppRoutes.profileOtherScreen:
        return ProfileOtherScreen();
      case AppRoutes.notificationsNoNotiScreen:
        return NotificationsNoNotiScreen();



      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the ngoScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.ngoScreen);
  }
  onConnect(BuildContext context){
    print("Connect");
    Navigator.pushNamed(context, AppRoutes.checkoutPageTabContainerScreen);
  }

  /// Navigates to the profileFollowedScreen when the action is triggered.
  onTapFollow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileFollowedScreen);
  }
}
