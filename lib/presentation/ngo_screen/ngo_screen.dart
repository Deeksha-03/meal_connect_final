import 'package:meal_connect/presentation/home_page_extended_one_screen/home_page_extended_one_screen.dart';
import 'package:meal_connect/presentation/notification_user/notification_user_screen.dart';
import 'package:meal_connect/presentation/notifications_no_noti_screen/notifications_no_noti_screen.dart';
import 'package:meal_connect/presentation/profile_user_screen/profile_user_screen.dart';

import '../ngo_screen/widgets/userprofile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';


// ignore_for_file: must_be_immutable
class NgoScreen extends StatelessWidget {
  NgoScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 49.v),
                      _buildUserProfile(context)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 94.v,
        title: Padding(
            padding: EdgeInsets.only(left: 38.h),
            child: Row(children: [
              AppbarSubtitleTwo(text: "MEAL\nCONNECT"),
              AppbarTitle(
                  text: "NGO’s", margin: EdgeInsets.only(left: 39.h, top: 4.v))
            ])),
        actions: [
          AppbarTrailingIconbutton(
              imagePath: ImageConstant.imgNgoLogo,
              margin: EdgeInsets.fromLTRB(38.h, 38.v, 38.h, 22.v))
        ],
        styleType: Style.bgFill);
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 26.v);
            },
            itemCount: 5,
            itemBuilder: (context, index) {
              return UserprofileItemWidget(onTapUserProfile: () {
                onTapUserProfile(context);
              });
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
        return AppRoutes.homePageExtendedOneScreen;
      case BottomBarEnum.Ngo:
        return AppRoutes.ngoScreen;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationUserScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileUserScreen;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageExtendedOneScreen:
        return HomePageExtendedOneScreen();
      case AppRoutes.ngoScreen:
        return NgoScreen();
      case AppRoutes.notificationUserScreen:
        return NotificationUserScreen();
      case AppRoutes.profileUserScreen:
        return ProfileUserScreen();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the profileOtherScreen when the action is triggered.
  onTapUserProfile(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profileOtherScreen);
  }
}
