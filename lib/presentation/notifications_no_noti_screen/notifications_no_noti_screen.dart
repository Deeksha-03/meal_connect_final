import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/presentation/ngo_order_list_screen/ngo_order_list_screen.dart';
import 'package:meal_connect/presentation/profile_other_screen/profile_other_screen.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';

class NotificationsNoNotiScreen extends StatelessWidget {
  NotificationsNoNotiScreen({Key? key})
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
}
