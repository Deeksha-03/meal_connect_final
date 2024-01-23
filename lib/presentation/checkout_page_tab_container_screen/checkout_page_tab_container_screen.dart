import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/checkout_page_two_page/checkout_page_two_page.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/widgets/app_bar/appbar_subtitle.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';

class CheckoutPageTabContainerScreen extends StatefulWidget {
  const CheckoutPageTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  CheckoutPageTabContainerScreenState createState() =>
      CheckoutPageTabContainerScreenState();
}

class CheckoutPageTabContainerScreenState
    extends State<CheckoutPageTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 25.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 322.h,
                          margin: EdgeInsets.only(
                            left: 39.h,
                            right: 67.h,
                          ),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Donating is about making\na ",
                                  style: CustomTextStyles
                                      .headlineMediumPlusJakartaSansBluegray900SemiBold,
                                ),
                                TextSpan(
                                  text: "Difference",
                                  style: CustomTextStyles
                                      .headlineMediumPlusJakartaSansPrimary,
                                ),
                                TextSpan(
                                  text: ".",
                                  style: CustomTextStyles
                                      .headlineMediumPlusJakartaSansPrimary,
                                ),
                              ],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      SizedBox(height: 52.v),
                      Container(
                        margin: EdgeInsets.only(
                          left: 86.h,
                          right: 91.h,
                        ),
                        decoration: AppDecoration.outlineBlack9004.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder8,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Your Contribution",
                              style:
                                  CustomTextStyles.titleMediumBluegray900Bold,
                            ),
                            SizedBox(height: 27.v),
                            Container(
                              height: 32.v,
                              width: 251.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  8.h,
                                ),
                                border: Border.all(
                                  color: theme.colorScheme.primary,
                                  width: 1.h,
                                ),
                              ),
                              child: TabBar(
                                controller: tabviewController,
                                labelPadding: EdgeInsets.zero,
                                tabs: [
                                  Tab(
                                    child: SizedBox(
                                      height: 32.v,
                                      width: 129.h,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/imgRectangle6.svg', // Replace with your SVG file path
                                            height: 32.v,
                                            width: 129.h,
                                            alignment: Alignment.center,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 6.v),
                                              child: Text(
                                                "Number of meals",
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Kg",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 867.v,
                        child: TabBarView(
                          controller: tabviewController,
                          children: [
                            CheckoutPageTwoPage(),
                            CheckoutPageTwoPage(),
                          ],
                        ),
                      ),
                    ],
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
      title: AppbarSubtitle(
        text: "MEAL\nCONNECT",
        margin: EdgeInsets.only(left: 38.h),
      ),
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
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
