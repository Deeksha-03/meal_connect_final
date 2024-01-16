import '../home_page_extended_screen/widgets/widget2_item_widget.dart';
import '../home_page_extended_screen/widgets/widget3_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:meal_connect/widgets/custom_icon_button.dart';
import 'package:meal_connect/widgets/custom_outlined_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:meal_connect/presentation/home_page_extended_screen/home_page_extended_screen.dart';
import 'package:meal_connect/presentation/notifications_no_noti_screen/notifications_no_noti_screen.dart';
import 'package:meal_connect/presentation/profile_user_screen/profile_user_screen.dart';



class HomePageExtendedScreen extends StatelessWidget {
  HomePageExtendedScreen({Key? key})
      : super(
          key: key,
        );

  int sliderIndex = 1;

  int sliderIndex1 = 1;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: 429.h,
          child: Column(
            children: [
              SizedBox(height: 25.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(left: 1.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 301.h,
                            margin: EdgeInsets.only(
                              left: 38.h,
                              right: 88.h,
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Sharing is about making\na ",
                                    style: CustomTextStyles
                                        .headlineMediumPlusJakartaSansBluegray900SemiBold,
                                  ),
                                  TextSpan(
                                    text: "Difference.",
                                    style: CustomTextStyles
                                        .headlineMediumPlusJakartaSansPrimary,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        SizedBox(height: 37.v),
                        _buildSliderSettings(context),
                        SizedBox(height: 25.v),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 31.h,
                            right: 42.h,
                          ),
                          child: _buildWatchTheImpact(
                            context,
                            dynamicText: "LOCATIONS",
                            dynamicText1: "See all",
                          ),
                        ),
                        SizedBox(height: 29.v),
                        CustomOutlinedButton(
                          height: 91.v,
                          text: "JAMES BOND",
                          margin: EdgeInsets.only(
                            left: 28.h,
                            right: 53.h,
                          ),
                          buttonStyle: CustomButtonStyles.outlinePrimaryTL14,
                          buttonTextStyle: CustomTextStyles
                              .headlineMediumPlusJakartaSansOnPrimaryContainer,
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(height: 31.v),
                        _buildCampaign1(context),
                        SizedBox(height: 49.v),
                        _buildFiftyFive(context),
                        SizedBox(height: 73.v),
                        _buildFiftySix(context),
                        SizedBox(height: 29.v),
                        _buildSixtySeven(context),
                      ],
                    ),
                  ),
                ),
              ),
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
      height: 94.v,
      width: 200.h,
      title: AppbarSubtitleOne(
        text: "MEAL\nCONNECT",
        margin: EdgeInsets.only(left: 48.h),
      ),
    );
  }

  /// Section Widget
  Widget _buildSliderSettings(BuildContext context) {
    return SizedBox(
      height: 220.v,
      width: 355.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 220.v,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              scrollDirection: Axis.horizontal,
              onPageChanged: (
                index,
                reason,
              ) {
                sliderIndex = index;
              },
            ),
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return Widget2ItemWidget();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 6.v,
              margin: EdgeInsets.only(bottom: 16.v),
              child: AnimatedSmoothIndicator(
                activeIndex: sliderIndex,
                count: 1,
                axisDirection: Axis.horizontal,
                effect: ScrollingDotsEffect(
                  spacing: 14,
                  activeDotColor: appTheme.blue400,
                  dotColor: theme.colorScheme.onPrimaryContainer,
                  dotHeight: 6.v,
                  dotWidth: 6.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildCampaign1(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 31.h,
        right: 42.h,
      ),
      decoration: AppDecoration.outlineBlack9003.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 234.v,
            width: 352.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 23.h,
                      bottom: 4.v,
                    ),
                    child: Text(
                      "Ensuring food for all the child...",
                      style: CustomTextStyles.titleMediumBluegray900Bold_1,
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgImage502,
                  height: 234.v,
                  width: 352.h,
                  radius: BorderRadius.circular(
                    43.h,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 15.v),
          Container(
            margin: EdgeInsets.only(right: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 23.h),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "200 kg Food prevented from wastage",
                    style: CustomTextStyles.titleSmallPrimary_1,
                  ),
                ),
                SizedBox(height: 17.v),
                Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            bottom: 5.v,
                          ),
                          child: Container(
                            height: 1.v,
                            width: 243.h,
                            decoration: BoxDecoration(
                              color: appTheme.blue600.withOpacity(0.3),
                            ),
                            child: ClipRRect(
                              child: LinearProgressIndicator(
                                value: 0.55,
                                backgroundColor:
                                    appTheme.blue600.withOpacity(0.3),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Text(
                          "50%",
                          style: CustomTextStyles.labelLargeExtraBold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.v),
                Padding(
                  padding: EdgeInsets.only(right: 8.h),
                  child: _buildDonatorsCounter(
                    context,
                    donatorsText: "300 Contributors",
                    durationText: "14 days left",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 29.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftyFive(BuildContext context) {
    return SizedBox(
      height: 374.v,
      width: 355.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 29.v,
              ),
              decoration: AppDecoration.outlineBlack9003.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 176.v),
                  Text(
                    "Ensuring food for all the child...",
                    style: CustomTextStyles.titleMediumBluegray900Bold_1,
                  ),
                  SizedBox(height: 19.v),
                  Text(
                    "200 kg Food prevented from wastage",
                    style: CustomTextStyles.titleSmallPrimary_1,
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: EdgeInsets.only(right: 11.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            bottom: 5.v,
                          ),
                          child: Container(
                            height: 1.v,
                            width: 243.h,
                            decoration: BoxDecoration(
                              color: appTheme.blue600.withOpacity(0.3),
                            ),
                            child: ClipRRect(
                              child: LinearProgressIndicator(
                                value: 0.55,
                                backgroundColor:
                                    appTheme.blue600.withOpacity(0.3),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text(
                            "50%",
                            style: CustomTextStyles.labelLargeExtraBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(right: 11.h),
                    child: _buildDonatorsCounter(
                      context,
                      donatorsText: "300 Donators",
                      durationText: "14 days left",
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgImage493,
            height: 189.v,
            width: 355.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.topCenter,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFiftySix(BuildContext context) {
    return SizedBox(
      height: 386.v,
      width: 356.h,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(right: 1.h),
              padding: EdgeInsets.symmetric(
                horizontal: 23.h,
                vertical: 29.v,
              ),
              decoration: AppDecoration.outlineBlack9003.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 176.v),
                  Text(
                    "Ensuring food for all the child...",
                    style: CustomTextStyles.titleMediumBluegray900Bold_1,
                  ),
                  SizedBox(height: 19.v),
                  Text(
                    "200 kg Food prevented from wastage",
                    style: CustomTextStyles.titleSmallPrimary_1,
                  ),
                  SizedBox(height: 17.v),
                  Padding(
                    padding: EdgeInsets.only(right: 11.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 10.v,
                            bottom: 5.v,
                          ),
                          child: Container(
                            height: 1.v,
                            width: 243.h,
                            decoration: BoxDecoration(
                              color: appTheme.blue600.withOpacity(0.3),
                            ),
                            child: ClipRRect(
                              child: LinearProgressIndicator(
                                value: 0.55,
                                backgroundColor:
                                    appTheme.blue600.withOpacity(0.3),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 24.h),
                          child: Text(
                            "50%",
                            style: CustomTextStyles.labelLargeExtraBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.v),
                  Padding(
                    padding: EdgeInsets.only(right: 11.h),
                    child: _buildDonatorsCounter(
                      context,
                      donatorsText: "300 Donators",
                      durationText: "14 days left",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 210.v,
              width: 354.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 210.v,
                      initialPage: 0,
                      autoPlay: true,
                      viewportFraction: 1.0,
                      enableInfiniteScroll: false,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (
                        index,
                        reason,
                      ) {
                        sliderIndex1 = index;
                      },
                    ),
                    itemCount: 1,
                    itemBuilder: (context, index, realIndex) {
                      return Widget3ItemWidget();
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 6.v,
                      margin: EdgeInsets.only(bottom: 6.v),
                      child: AnimatedSmoothIndicator(
                        activeIndex: sliderIndex1,
                        count: 1,
                        axisDirection: Axis.horizontal,
                        effect: ScrollingDotsEffect(
                          spacing: 14,
                          activeDotColor: appTheme.blue400,
                          dotColor: theme.colorScheme.onPrimaryContainer,
                          dotHeight: 6.v,
                          dotWidth: 6.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSixtySeven(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.h),
            child: _buildWatchTheImpact(
              context,
              dynamicText: "Watch the impact",
              dynamicText1: "See all",
            ),
          ),
          SizedBox(height: 40.v),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 210.v,
              width: 391.h,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: IntrinsicWidth(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildVideo2(
                              context,
                              userImage: ImageConstant.imgImage491210x155,
                              livesEnlightenedText: "Smiles enriched",
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgImage491210x155,
                              height: 210.v,
                              width: 155.h,
                              radius: BorderRadius.circular(
                                20.h,
                              ),
                              margin: EdgeInsets.only(left: 195.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 61.h),
                    child: _buildVideo2(
                      context,
                      userImage: ImageConstant.imgImage492210x155,
                      livesEnlightenedText: "Lives enlightened",
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 350.h),
                      child: IntrinsicWidth(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 26.v),
                          decoration: AppDecoration.fillBlack.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder20,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(height: 57.v),
                              CustomImageView(
                                imagePath: ImageConstant.imgPlayCircleBlue400,
                                height: 42.adaptSize,
                                width: 42.adaptSize,
                              ),
                              SizedBox(height: 41.v),
                              Text(
                                "Future’s inspired",
                                style: CustomTextStyles
                                    .labelLargeOnPrimaryContainer,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  /// Common widget
  Widget _buildDonatorsCounter(
    BuildContext context, {
    required String donatorsText,
    required String durationText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 1.v),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "300 ",
                  style: CustomTextStyles.titleSmallPrimary,
                ),
                TextSpan(
                  text: "Donators",
                  style: CustomTextStyles.titleSmallGray500,
                ),
              ],
            ),
            textAlign: TextAlign.left,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "14 ",
                style: CustomTextStyles.titleSmallPrimary,
              ),
              TextSpan(
                text: "days",
                style: CustomTextStyles.titleSmallGray500,
              ),
              TextSpan(
                text: " ",
              ),
              TextSpan(
                text: "left",
                style: CustomTextStyles.titleSmallGray500,
              ),
            ],
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildWatchTheImpact(
    BuildContext context, {
    required String dynamicText,
    required String dynamicText1,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 1.v),
          child: Text(
            dynamicText,
            style: CustomTextStyles.titleMediumBlack900_1.copyWith(
              color: appTheme.black900,
            ),
          ),
        ),
        Text(
          dynamicText1,
          style: CustomTextStyles.titleMediumPrimary_1.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildVideo2(
    BuildContext context, {
    required String userImage,
    required String livesEnlightenedText,
  }) {
    return SizedBox(
      height: 210.v,
      width: 155.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: userImage,
            height: 210.v,
            width: 155.h,
            radius: BorderRadius.circular(
              20.h,
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.h,
                vertical: 26.v,
              ),
              decoration: AppDecoration.fillBlack.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 57.v),
                  CustomIconButton(
                    height: 42.adaptSize,
                    width: 42.adaptSize,
                    padding: EdgeInsets.all(3.h),
                    alignment: Alignment.center,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgPlayCircle,
                    ),
                  ),
                  SizedBox(height: 41.v),
                  Text(
                    livesEnlightenedText,
                    style:
                        CustomTextStyles.labelLargeOnPrimaryContainer.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            context, getCurrentRoute(type));
      },
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Explore:
        return AppRoutes.homePageExtendedOneScreen;
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

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ngoOrderListPage:
        return NgoOrderListPage();
      default:
        return DefaultWidget();
    }
  }
}
