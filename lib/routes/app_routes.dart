import 'dart:js';

import 'package:flutter/material.dart';
import 'package:meal_connect/presentation/start_page_one_screen/start_page_one_screen.dart';
import 'package:meal_connect/presentation/startup_page_screen/startup_page_screen.dart';
import 'package:meal_connect/presentation/start_page_two_screen/start_page_two_screen.dart';
import 'package:meal_connect/presentation/start_page_three_screen/start_page_three_screen.dart';
import 'package:meal_connect/presentation/profile_creation_screen/profile_creation_screen.dart';
import 'package:meal_connect/presentation/profile_creation_filled_screen/profile_creation_filled_screen.dart';
import 'package:meal_connect/presentation/successful_one_screen/successful_one_screen.dart';
import 'package:meal_connect/presentation/profile_other_one_screen/profile_other_one_screen.dart';
import 'package:meal_connect/presentation/ngo_order_list_container_screen/ngo_order_list_container_screen.dart';
import 'package:meal_connect/presentation/welcome_page_screen/welcome_page_screen.dart';
import 'package:meal_connect/presentation/welcome_page_one_screen/welcome_page_one_screen.dart';
import 'package:meal_connect/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:meal_connect/presentation/select_location_screen/select_location_screen.dart';
import 'package:meal_connect/presentation/select_location_selected_screen/select_location_selected_screen.dart';
import 'package:meal_connect/presentation/user_and_ngo_welcome_screen/user_and_ngo_welcome_screen.dart';
import 'package:meal_connect/presentation/sign_up_for_ngo_screen/sign_up_for_ngo_screen.dart';
import 'package:meal_connect/presentation/code_verification_one_screen/code_verification_one_screen.dart';
import 'package:meal_connect/presentation/ngo_verification_page_screen/ngo_verification_page_screen.dart';
import 'package:meal_connect/presentation/successful_screen/successful_screen.dart';
import 'package:meal_connect/presentation/sign_in_disabled_screen/sign_in_disabled_screen.dart';
import 'package:meal_connect/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:meal_connect/presentation/sign_in_invalid_stage_screen/sign_in_invalid_stage_screen.dart';
import 'package:meal_connect/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:meal_connect/presentation/forgot_password_input_screen/forgot_password_input_screen.dart';
import 'package:meal_connect/presentation/forgot_password_invalid_screen/forgot_password_invalid_screen.dart';
import 'package:meal_connect/presentation/code_verification_screen/code_verification_screen.dart';
import 'package:meal_connect/presentation/code_verification_code_invalid_screen/code_verification_code_invalid_screen.dart';
import 'package:meal_connect/presentation/code_verification_input_screen/code_verification_input_screen.dart';
import 'package:meal_connect/presentation/home_page_extended_one_screen/home_page_extended_one_screen.dart';
import 'package:meal_connect/presentation/home_page_extended_screen/home_page_extended_screen.dart';
import 'package:meal_connect/presentation/profile_user_screen/profile_user_screen.dart';
import 'package:meal_connect/presentation/ngo_screen/ngo_screen.dart';
import 'package:meal_connect/presentation/profile_other_screen/profile_other_screen.dart';
import 'package:meal_connect/presentation/profile_followed_screen/profile_followed_screen.dart';
import 'package:meal_connect/presentation/profile_other_two_screen/profile_other_two_screen.dart';
import 'package:meal_connect/presentation/checkout_page_tab_container_screen/checkout_page_tab_container_screen.dart';
import 'package:meal_connect/presentation/successful_two_screen/successful_two_screen.dart';
import 'package:meal_connect/presentation/notifications_no_noti_screen/notifications_no_noti_screen.dart';
import 'package:meal_connect/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:meal_connect/presentation/ngo_order_list_screen/ngo_order_list_screen.dart';
import 'package:meal_connect/presentation/notification_user/notification_user_screen.dart';

class AppRoutes {
  static const String startPageOneScreen = '/start_page_one_screen';

  static const String startupPageScreen = '/startup_page_screen';

  static const String startPageTwoScreen = '/start_page_two_screen';

  static const String startPageThreeScreen = '/start_page_three_screen';

  static const String profileCreationScreen = '/profile_creation_screen';

  static const String profileCreationFilledScreen =
      '/profile_creation_filled_screen';

  static const String successfulOneScreen = '/successful_one_screen';

  static const String profileOtherOneScreen = '/profile_other_one_screen';  //ngo-side profile

  static const String ngoOrderListPage = '/ngo_order_list_page';

  static const String ngoOrderListScreen = '/ngo_order_list_screen';

  static const String ngoOrderListContainerScreen =
      '/ngo_order_list_container_screen';

  static const String welcomePageScreen = '/welcome_page_screen';

  static const String welcomePageOneScreen = '/welcome_page_one_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String selectLocationScreen = '/select_location_screen';

  static const String selectLocationSelectedScreen =
      '/select_location_selected_screen';

  static const String userAndNgoWelcomeScreen = '/user_and_ngo_welcome_screen';

  static const String signUpForNgoScreen = '/sign_up_for_ngo_screen';

  static const String codeVerificationOneScreen =
      '/code_verification_one_screen';

  static const String ngoVerificationPageScreen =
      '/ngo_verification_page_screen';

  static const String successfulScreen = '/successful_screen';

  static const String signInDisabledScreen = '/sign_in_disabled_screen';

  static const String signInScreen = '/sign_in_screen';

  static const String signInInvalidStageScreen =
      '/sign_in_invalid_stage_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String forgotPasswordInputScreen =
      '/forgot_password_input_screen';

  static const String forgotPasswordInvalidScreen =
      '/forgot_password_invalid_screen';

  static const String codeVerificationScreen = '/code_verification_screen';

  static const String codeVerificationCodeInvalidScreen =
      '/code_verification_code_invalid_screen';

  static const String codeVerificationInputScreen =
      '/code_verification_input_screen';

  static const String homePageExtendedOneScreen =
      '/home_page_extended_one_screen';

  static const String homePageExtendedScreen = '/home_page_extended_screen';

  static const String profileUserScreen = '/profile_user_screen';

  static const String ngoScreen = '/ngo_screen';

  static const String profileOtherScreen = '/profile_other_screen';

  static const String profileFollowedScreen = '/profile_followed_screen';

  static const String profileOtherTwoScreen = '/profile_other_two_screen';

  static const String checkoutPageTwoPage = '/checkout_page_two_page';

  static const String checkoutPage = '/checkout_page';

  static const String checkoutPageTabContainerScreen =
      '/checkout_page_tab_container_screen';

  static const String successfulTwoScreen = '/successful_two_screen';

  static const String notificationsNoNotiScreen =
      '/notifications_no_noti_screen';
  static const String notificationUserScreen = '/notification_user_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    startPageOneScreen: (context) => StartPageOneScreen(),
    startupPageScreen: (context) => StartupPageScreen(),
    startPageTwoScreen: (context) => StartPageTwoScreen(),
    startPageThreeScreen: (context) => StartPageThreeScreen(),
    profileCreationScreen: (context) => ProfileCreationScreen(),
    profileCreationFilledScreen: (context) => ProfileCreationFilledScreen(),
    successfulOneScreen: (context) => SuccessfulOneScreen(),
    profileOtherOneScreen: (context) => ProfileOtherOneScreen(),
    ngoOrderListContainerScreen: (context) => NgoOrderListContainerScreen(),
    ngoOrderListScreen: (context)=> NgoOrderListScreen(),
    welcomePageScreen: (context) => WelcomePageScreen(),
    welcomePageOneScreen: (context) => WelcomePageOneScreen(),
    signUpScreen: (context) => SignUpScreen(),
    selectLocationScreen: (context) => SelectLocationScreen(),
    // selectLocationSelectedScreen: (context) => SelectLocationSelectedScreen(),
    userAndNgoWelcomeScreen: (context) => UserAndNgoWelcomeScreen(),
    signUpForNgoScreen: (context) => SignUpForNgoScreen(),
    codeVerificationOneScreen: (context) => CodeVerificationOneScreen(),
    ngoVerificationPageScreen: (context) => NgoVerificationPageScreen(),
    successfulScreen: (context) => SuccessfulScreen(),
    signInDisabledScreen: (context) => SignInDisabledScreen(),
    signInScreen: (context) => SignInScreen(),
    signInInvalidStageScreen: (context) => SignInInvalidStageScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    forgotPasswordInputScreen: (context) => ForgotPasswordInputScreen(),
    forgotPasswordInvalidScreen: (context) => ForgotPasswordInvalidScreen(),
    codeVerificationScreen: (context) => CodeVerificationScreen(),
    codeVerificationCodeInvalidScreen: (context) =>
        CodeVerificationCodeInvalidScreen(),
    codeVerificationInputScreen: (context) => CodeVerificationInputScreen(),
    homePageExtendedOneScreen: (context) => HomePageExtendedOneScreen(),
    homePageExtendedScreen: (context) => HomePageExtendedScreen(),
    profileUserScreen: (context) => ProfileUserScreen(),
    ngoScreen: (context) => NgoScreen(),
    profileOtherScreen: (context) => ProfileOtherScreen(),
    profileFollowedScreen: (context) => ProfileFollowedScreen(),
    profileOtherTwoScreen: (context) => ProfileOtherTwoScreen(),
    checkoutPageTabContainerScreen: (context) =>
        CheckoutPageTabContainerScreen(),
    successfulTwoScreen: (context) => SuccessfulTwoScreen(),
    notificationsNoNotiScreen: (context) => NotificationsNoNotiScreen(),
    notificationUserScreen: (context) => NotificationUserScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
