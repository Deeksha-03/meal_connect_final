import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_three.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class NgoOrderListPage extends StatelessWidget {
  NgoOrderListPage({Key? key})
      : super(
          key: key,
        );

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
          onChanged: (BottomBarEnum type) {
            Navigator.pushNamed(
                navigatorKey.currentContext!, getCurrentRoute(type));
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
  /// Section Widget

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

///section widget
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
              timeZoneText: "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
            ),
          ),
          SizedBox(height: 36.v), // Space between repeated _buildContrast
        ],
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(height: 36.v),
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
        _buildDateItem(context, "4th November, 2022", 1), // Prints Padding with _buildContrast 3 times
        _buildDateItem(context, "5th November, 2022", 1),
        _buildDateItem(context, "6th November, 2022", 2),// Prints Padding with _buildContrast 2 times
        // Add more date items as needed with the specified number of repeats
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


  /// Section Widget
  // Widget _buildDateColumn(BuildContext context) {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 26.h),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Padding(
  //           padding: EdgeInsets.only(left: 5.h),
  //           child: RichText(
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: " ",
  //                 ),
  //                 TextSpan(
  //                   text: "5th November, 2022",
  //                   style: CustomTextStyles.titleSmallGray500,
  //                 ),
  //               ],
  //             ),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //         SizedBox(height: 36.v),
  //         Padding(
  //           padding: EdgeInsets.only(left: 5.h),
  //           child: _buildContrast(
  //             context,
  //             donationSuccessfulText: "Donation Successful",
  //             timeZoneText:
  //                 "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
  //           ),
  //         ),
  //         SizedBox(height:36.v),
  //         Padding(
  //           padding: EdgeInsets.only(left: 5.h),
  //           child: RichText(
  //             text: TextSpan(
  //               children: [
  //                 TextSpan(
  //                   text: " ",
  //                 ),
  //                 TextSpan(
  //                   text: "4th November, 2022",
  //                   style: CustomTextStyles.titleSmallGray500,
  //                 ),
  //               ],
  //             ),
  //             textAlign: TextAlign.left,
  //           ),
  //         ),
  //         SizedBox(height: 36.v),
  //         Padding(
  //           padding: EdgeInsets.only(left: 5.h),
  //           child: _buildContrast(
  //             context,
  //             donationSuccessfulText: "Donation Successful",
  //             timeZoneText:
  //             "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
  //           ),
  //         ),
  //         SizedBox(height: 36.v),
  //         Padding(
  //           padding: EdgeInsets.only(left: 5.h),
  //           child: _buildContrast(
  //             context,
  //             donationSuccessfulText: "Donation Successful",
  //             timeZoneText:
  //             "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Section Widget
  // Widget _buildMainStack(BuildContext context) {
  //   int numberOfDonations = 4; // Replace this with the actual count of your DonationsuccessItemWidget
  //
  //   // Calculate the total height needed for the DonationsuccessItemWidget
  //   double totalItemHeight = numberOfDonations * 50.0;
  //
  //   return SizedBox(
  //     // height:totalItemHeight + 200.v,
  //     height:400.v,// height: 368.v, //change height here to fix the donation successful list
  //     width: double.maxFinite,
  //     child: Stack(
  //       alignment: Alignment.bottomLeft,
  //       children: [
  //         Align(
  //           alignment: Alignment.bottomLeft,
  //           child: Padding(
  //             padding: EdgeInsets.only(
  //               left: 47.h,
  //               bottom: 134.v,
  //             ),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //                       height: 10.adaptSize,
  //                       width: 10.adaptSize,
  //                       decoration: BoxDecoration(
  //                         color: theme.colorScheme.primary.withOpacity(0.75),
  //                         borderRadius: BorderRadius.circular(
  //                           5.h,
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       height: 2.adaptSize,
  //                       width: 2.adaptSize,
  //                       margin: EdgeInsets.only(
  //                         left: 57.h,
  //                         bottom: 7.v,
  //                       ),
  //                       decoration: BoxDecoration(
  //                         color: theme.colorScheme.primary.withOpacity(0.75),
  //                         borderRadius: BorderRadius.circular(
  //                           1.h,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(height: 11.v),
  //                 Align(
  //                   alignment: Alignment.centerRight,
  //                   child: Padding(
  //                     padding: EdgeInsets.only(right: 2.h),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.end,
  //                       children: [
  //                         Container(
  //                           height: 2.adaptSize,
  //                           width: 2.adaptSize,
  //                           margin: EdgeInsets.only(bottom: 2.v),
  //                           decoration: BoxDecoration(
  //                             color:
  //                                 theme.colorScheme.primary.withOpacity(0.75),
  //                             borderRadius: BorderRadius.circular(
  //                               1.h,
  //                             ),
  //                           ),
  //                         ),
  //                         Container(
  //                           height: 6.adaptSize,
  //                           width: 6.adaptSize,
  //                           margin: EdgeInsets.only(left: 44.h),
  //                           decoration: BoxDecoration(
  //                             color:
  //                                 theme.colorScheme.primary.withOpacity(0.75),
  //                             borderRadius: BorderRadius.circular(
  //                               3.h,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.bottomLeft,
  //           child: Container(
  //             height: 2.adaptSize,
  //             width: 2.adaptSize,
  //             margin: EdgeInsets.only(
  //               left: 87.h,
  //               bottom: 127.v,
  //             ),
  //             decoration: BoxDecoration(
  //               color: appTheme.blue600.withOpacity(0.5),
  //               borderRadius: BorderRadius.circular(
  //                 1.h,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(horizontal: 29.h),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   "1st November, 2022",
  //                   style: CustomTextStyles.titleSmallGray500_1,
  //                 ),
  //                 SizedBox(height: 260.v),
  //                 _buildContrast(
  //                   context,
  //                   donationSuccessfulText: "Donation Successful",
  //                   timeZoneText:
  //                       "Quis odio magna aliquet hac est ultrices. Sed ut tincidunt fames nibh.",
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Align(
  //           alignment: Alignment.topCenter,
  //           child: Padding(
  //             padding: EdgeInsets.fromLTRB(26.h, 46.v, 32.h, 134.v),
  //             child: ListView.separated(
  //               physics: NeverScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               separatorBuilder: (
  //                 context,
  //                 index,
  //               ) {
  //                 return SizedBox(
  //                   height: 37.v,
  //                 );
  //               },
  //               itemCount: 4,  // this count determines the number of successful donation list
  //               itemBuilder: (context, index) {
  //                 return DonationsuccessItemWidget();
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  /// Common widget
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
}
