import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/notifications_no_noti_screen/notifications_no_noti_screen.dart';
import 'package:meal_connect/presentation/profile_other_screen/profile_other_screen.dart';
import 'package:meal_connect/presentation/start_page_one_screen/start_page_one_screen.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';

// Combined screen class
class NgoOrderListScreen extends StatelessWidget {
  NgoOrderListScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 28.v),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 29.h),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Today",
                            style: CustomTextStyles.titleSmallSemiBold,
                          ),
                          TextSpan(
                            text: " : ",
                            style: CustomTextStyles.titleSmallBlack900_2,
                          ),
                          TextSpan(
                            text: "8th November, 2022",
                            style: CustomTextStyles.titleSmallGray500,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(height: 77.v),
                _buildDonationList(context),
                SizedBox(height: 70.v),
                _buildDateColumn(context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          onTap: (BottomBarEnum type) {
            Navigator.pushNamed(
              context,
              getCurrentRoute(type),
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 94.v,
      title: AppbarSubtitleThree(
        text: "MEAL\nCONNECT",
        margin: EdgeInsets.only(left: 38.h),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgMoreVertical,
          margin: EdgeInsets.fromLTRB(38.h, 38.v, 38.h, 22.v),
        ),
      ],
    );
  }

  Widget _buildDonationList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) => SizedBox(height: 41.v),
        itemCount: 2,
        itemBuilder: (context, index) => _donationListItem(context),
      ),
    );
  }

  Widget _buildDateItem(BuildContext context, String dateText, int numRepeats) {
    List<Widget> contrastWidgets = List.generate(numRepeats, (_) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.h),
            child: _buildContrast(
              context,
              donationSuccessfulText: "Donation Successful",
              timeZoneText:
                  "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
            ),
          ),
          SizedBox(height: 36.v), // Space between repeated _buildContrast
        ],
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 5.h),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: " ",
                ),
                TextSpan(
                  text: dateText,
                  style: CustomTextStyles.titleSmallGray500,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        SizedBox(height: 36.v),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: contrastWidgets,
        ),
      ],
    );
  }

  Widget _buildDateColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDateItem(context, "4th November, 2022", 1),
        _buildDateItem(context, "5th November, 2022", 1),
        _buildDateItem(context, "6th November, 2022", 2),
      ],
    );
  }

  Widget _donationListItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgMaskGroup,
                height: 46.adaptSize,
                width: 46.adaptSize,
              ),
              Container(
                width: 168.h,
                margin: EdgeInsets.only(left: 17.h, top: 7.v, bottom: 7.v),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Anonymous",
                        style: CustomTextStyles.labelLargeBlack900Bold,
                      ),
                      TextSpan(
                        text: " has requested to donate food",
                        style: CustomTextStyles.labelLargeBluegray900,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              CustomOutlinedButton(
                height: 34.v,
                width: 120.h,
                text: "Pending",
                margin: EdgeInsets.only(left: 12.h, top: 5.v, bottom: 7.v),
                buttonStyle: CustomButtonStyles.outlinePrimary,
              ),
            ],
          ),
          SizedBox(height: 41.v),
        ],
      ),
    );
  }

  Widget _buildContrast(
    BuildContext context, {
    required String donationSuccessfulText,
    required String timeZoneText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.v),
      decoration: AppDecoration.outlineBluegray10002.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgNgoLogo,
            height: 67.v,
            width: 70.h,
            margin: EdgeInsets.only(top: 1.v),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donationSuccessfulText,
                  style: CustomTextStyles.titleSmallSemiBold_1.copyWith(
                    color: appTheme.blueGray900,
                  ),
                ),
                SizedBox(height: 9.v),
                SizedBox(
                  width: 224.h,
                  child: Text(
                    timeZoneText,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.labelMediumMedium.copyWith(
                      color: appTheme.gray500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

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
