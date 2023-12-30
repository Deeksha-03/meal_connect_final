import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start Page_One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startPageOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Startup Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startupPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start Page_Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startPageTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Start Page_Three",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.startPageThreeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile creation",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileCreationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile Creation (filled)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileCreationFilledScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Successful One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successfulOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile(Other) One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileOtherOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "NGO-Order list - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.ngoOrderListContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Welcome Page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomePageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Welcome Page One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.welcomePageOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Select Location",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.selectLocationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Select Location(Selected)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.selectLocationSelectedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "User_and_ngo_welcome",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.userAndNgoWelcomeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign Up for NGO",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signUpForNgoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Code Verification One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.codeVerificationOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "NGO_verification page",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.ngoVerificationPageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Successful",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successfulScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign in (DIsabled)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signInDisabledScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign in",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signInScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign in(Invalid Stage)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.signInInvalidStageScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot Password",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot Password (Input)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordInputScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Forgot Password (Invalid)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.forgotPasswordInvalidScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Code Verification",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.codeVerificationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Code Verification (Code Invalid)",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.codeVerificationCodeInvalidScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Code Verification (Input)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.codeVerificationInputScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home Page(Extended) One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homePageExtendedOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home Page(Extended)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.homePageExtendedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile(user)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileUserScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "NGO",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.ngoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile(Other)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileOtherScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile(Followed)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileFollowedScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Profile(Other) Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.profileOtherTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Checkout_page - Tab Container",
                          onTapScreenTitle: () => onTapScreenTitle(context,
                              AppRoutes.checkoutPageTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Successful Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.successfulTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Notifications(No noti)",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.notificationsNoNotiScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
