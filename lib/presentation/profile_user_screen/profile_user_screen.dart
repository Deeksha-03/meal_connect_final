import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/presentation/ngo_order_list_page/ngo_order_list_page.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/appbar_trailing_iconbutton.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_bottom_bar.dart';
import 'package:meal_connect/widgets/custom_checkbox_button.dart';

class ProfileUserScreen extends StatefulWidget {
  ProfileUserScreen({Key? key}) : super(key: key);

  @override
  _ProfileUserScreenState createState() => _ProfileUserScreenState();
}

class _ProfileUserScreenState extends State<ProfileUserScreen> {
  bool userName = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: FutureBuilder<DocumentSnapshot>(
          future: _getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // Fetch user data
            var userData = snapshot.data?.data();

            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 35.h, vertical: 40.v),
              child: Column(
                children: [
                  Container(
                    height: 105.adaptSize,
                    width: 105.adaptSize,
                    padding: EdgeInsets.symmetric(
                      horizontal: 29.h,
                      vertical: 27.v,
                    ),
                    decoration: AppDecoration.fillBlueGray.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder52,
                    ),
                    child: CustomImageView(
                      imagePath: ImageConstant.imgIconParkSolid,
                      height: 45.adaptSize,
                      width: 45.adaptSize,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  SizedBox(height: 29.v),
                  _buildUserName(context),
                  SizedBox(height: 28.v),
                  Text(
                    "4,123",
                    style: CustomTextStyles.headlineSmallSemiBold,
                  ),
                  SizedBox(height: 6.v),
                  Text(
                    "Contributions",
                    style: CustomTextStyles.titleMediumGray500,
                  ),
                  SizedBox(height: 58.v),
                  _buildPhoneNo(context, userData as Map<String, dynamic>?),
                  SizedBox(height: 23.v),
                  _buildView(context, userData),
                  SizedBox(height: 5.v),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 55.h,
      leading: AppbarLeadingIconbuttonOne(
        imagePath: ImageConstant.imgUser,
        margin: EdgeInsets.only(left: 24.h, top: 12.v, bottom: 12.v),
      ),
      title: AppbarTitle(
        text: "Profile",
        margin: EdgeInsets.only(left: 25.h),
      ),
      actions: [
        AppbarTrailingIconbutton(
          imagePath: ImageConstant.imgMoreVertical,
          margin: EdgeInsets.symmetric(horizontal: 38.h, vertical: 11.v),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: 96.h),
        child: CustomCheckboxButton(
          alignment: Alignment.centerRight,
          width: 129.h,
          text: "User Name",
          value: userName,
          isRightCheck: true,
          onChange: (value) {
            setState(() {
              userName = value;
            });
          },
        ),
      ),
    );
  }

  /// Section Widget
  /// Section Widget
  Widget _buildPhoneNo(BuildContext context, Map<String, dynamic>? userData) {
    return GestureDetector(
      child: Container(
        width: 347.h,
        margin: EdgeInsets.only(left: 11.h),
        padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 3.v),
        decoration: AppDecoration.outlinePrimary.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 2.v),
            Text(
              "Phone no: ${userData?['phone'] ?? ''}",
              style: CustomTextStyles.headlineMediumPlusJakartaSansPrimarySemiBold,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildView(BuildContext context, Map<String, dynamic>? userData) {
    var user;
    return SizedBox(
      height: 43.v,
      width: 347.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                onTapView(context);
              },
              child: Container(
                height: 43.v,
                width: 347.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.h),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 1.h,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: Text(
                "Email: ${userData?['email'] ?? ''}",
                style: CustomTextStyles.headlineMediumPlusJakartaSansPrimarySemiBold,
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
        return AppRoutes.homePageExtendedScreen;
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

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.ngoOrderListPage:
        return NgoOrderListPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates to the homePageExtendedScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageExtendedScreen);
  }

  Future<DocumentSnapshot> _getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    return await FirebaseFirestore.instance.collection('users').doc(user?.uid).get();
  }


}
