import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/home_page_extended_one_screen/home_page_extended_one_screen.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/presentation/ngo_order_list_screen/ngo_order_list_screen.dart';
import 'package:meal_connect/presentation/ngo_screen/ngo_screen.dart';
import 'package:meal_connect/presentation/profile_other_screen/profile_other_screen.dart';
import 'package:meal_connect/presentation/profile_user_screen/profile_user_screen.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';

class NotificationUserScreen extends StatelessWidget {
  NotificationUserScreen({Key? key})
      : super(
    key: key,
  );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 149.v),
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgGroup2180Primary,
                height: 188.v,
                width: 194.h,
              ),
              SizedBox(height: 44.v),
              Text(
                "You have no notification.",
                style: CustomTextStyles.headlineSmallGray500,
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 38.h),
        child: Row(
          children: [
            AppbarSubtitleThree(
              text: "MEAL\nCONNECT",
            ),
            AppbarTitle(
              text: "Notifiication",
              margin: EdgeInsets.only(
                left: 38.h,
                top: 4.v,
              ),
            ),
          ],
        ),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgMoreVertical,
          margin: EdgeInsets.symmetric(
            horizontal: 38.h,
            vertical: 11.v,
          ),
        ),
      ],
    );
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

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.homePageExtendedOneScreen:
        return HomePageExtendedOneScreen(); // Use the same screen for now, you might want to change it.
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
}
