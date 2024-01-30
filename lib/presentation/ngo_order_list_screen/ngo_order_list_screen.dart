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
import 'package:meal_connect/routes/app_routes.dart';

// Combined screen class
class NgoOrderListScreen extends StatefulWidget {
  const NgoOrderListScreen({Key? key}) : super(key: key);

  @override
  _NgoOrderListScreenState createState() => _NgoOrderListScreenState();
}

class _NgoOrderListScreenState extends State<NgoOrderListScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  List<bool> selectedItems = List.generate(2, (index) => false);
  Map<String, int> dateItems = {
    "7th November, 2022": 1,
    "6th November, 2022": 1,
    "5th November, 2022": 2,
    "4th November, 2022": 2,
  };

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
                            text: "7th November, 2022",
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
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (context, index) => _donationListItem(context, index),
      ),
    );
  }

  Widget _donationListItem(BuildContext context, int index) {
    return selectedItems[index]
        ? SizedBox.shrink()
        : Padding(
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
                onPressed: () {
                  setState(() {
                    selectedItems[index] = true;
                    _updateDateColumn();
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 41.v),
        ],
      ),
    );
  }

  void _updateDateColumn() {
    // Example: Increase the repeats for the selected date
    dateItems["7th November, 2022"] = (dateItems["7th November, 2022"] ?? 0) + 1;

    // You can call setState to trigger a rebuild of the widget tree
    setState(() {});
  }

  Widget _buildDateColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: dateItems.keys.map((dateText) {
        return _buildDateItem(context, dateText, dateItems[dateText] ?? 0);
      }).toList(),
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
          SizedBox(height: 36.v),
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
        return AppRoutes.profileOtherOneScreen;
      case BottomBarEnum.Notification:
        return AppRoutes.notificationsNoNotiScreen;
      case BottomBarEnum.Profile:
        return AppRoutes.profileOtherOneScreen;
      default:
        return "/";
    }
  }

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ngoOrderListScreen:
        return NgoOrderListScreen();
      case AppRoutes.profileOtherOneScreen:
        return ProfileOtherScreen();
      case AppRoutes.notificationsNoNotiScreen:
        return NotificationsNoNotiScreen();
      default:
        return DefaultWidget();
    }
  }
}