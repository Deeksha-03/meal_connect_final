import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title_image.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController johnController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 28.h),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 124.v,
                                width: 127.h,
                                child: Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      CustomImageView(
                                          imagePath: ImageConstant.imgNavNgo,
                                          height: 100.v,
                                          width: 105.h,
                                          alignment: Alignment.bottomRight,
                                          margin: EdgeInsets.only(
                                              right: 7.h, bottom: 6.v)),
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgVectorBlue60019x19,
                                          height: 19.adaptSize,
                                          width: 19.adaptSize,
                                          alignment: Alignment.bottomLeft),
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgVectorBlue60016x22,
                                          height: 15.v,
                                          width: 18.h,
                                          alignment: Alignment.topRight),
                                      CustomImageView(
                                          imagePath: ImageConstant
                                              .imgVectorBlue60013x14,
                                          height: 13.v,
                                          width: 14.h,
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.only(
                                              left: 5.h, top: 10.v))
                                    ])),
                            CustomImageView(
                                imagePath: ImageConstant.imgVectorBlue60019x19,
                                height: 8.adaptSize,
                                width: 8.adaptSize,
                                margin:
                                EdgeInsets.only(top: 110.v, bottom: 5.v))
                          ]),
                      SizedBox(height: 9.v),
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorBlue60019x19,
                          height: 4.adaptSize,
                          width: 4.adaptSize),
                      SizedBox(height: 38.v),
                      Text("Start your journey",
                          style: theme.textTheme.headlineSmall),
                      SizedBox(height: 60.v),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: EdgeInsets.only(left: 30.h),
                              child: Row(children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 3.v),
                                    child: Text("Username (or) email",
                                        style: theme.textTheme.titleSmall)),
                                Padding(
                                    padding:
                                    EdgeInsets.only(left: 3.h, bottom: 4.v),
                                    child: Text("*",
                                        style: theme.textTheme.bodyMedium))
                              ]))),
                      SizedBox(height: 8.v),
                      Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: CustomTextFormField(
                              controller: johnController)),
                      SizedBox(height: 48.v),
                      _buildPasswordSection(context),
                      SizedBox(height: 81.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtForgotpassword(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Forgot",
                                    style: CustomTextStyles
                                        .titleSmallPrimaryBold_2),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "password?",
                                    style: CustomTextStyles
                                        .titleSmallPrimaryBold_2)
                              ]),
                              textAlign: TextAlign.left)),
                      SizedBox(height: 24.v),
                      CustomElevatedButton(
                          text: "Sign In",
                          margin: EdgeInsets.only(left: 27.h, right: 15.h),
                          onPressed: () {
                            _handleSignIn(context);
                          }),
                      SizedBox(height: 57.v),
                      GestureDetector(
                          onTap: () {
                            onTapTxtDonthaveanaccount(context);
                          },
                          child: SizedBox(
                              width: 153.h,
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "Don’t have an account?\n ",
                                        style: CustomTextStyles
                                            .titleSmallBlack900_3),
                                    TextSpan(
                                        text: "Sign",
                                        style: CustomTextStyles
                                            .titleSmallPrimaryBold_2),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "up",
                                        style: CustomTextStyles
                                            .titleSmallPrimaryBold_2)
                                  ]),
                                  textAlign: TextAlign.center))),
                      SizedBox(height: 5.v)
                    ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 55.h,
        leading: AppbarLeadingIconbuttonOne(
            imagePath: ImageConstant.imgUser,
            margin: EdgeInsets.only(left: 24.h, top: 12.v, bottom: 12.v),
            onTap: () {
              onTapUser(context);
            }),
        centerTitle: true,
        title:
        AppbarTitleImage(imagePath: ImageConstant.imgVectorBlue60013x14));
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 12.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 18.h),
              child: Row(children: [
                Padding(
                    padding: EdgeInsets.only(top: 2.v),
                    child: Text("Password", style: theme.textTheme.titleSmall)),
                Padding(
                    padding: EdgeInsets.only(left: 3.h, bottom: 3.v),
                    child: Text("*", style: theme.textTheme.bodyMedium))
              ])),
          SizedBox(height: 9.v),
          CustomTextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              suffix: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 13.v, 27.h, 11.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgAntdesigneyeinvisiblefilled,
                      height: 28.adaptSize,
                      width: 28.adaptSize)),
              suffixConstraints: BoxConstraints(maxHeight: 52.v),
              obscureText: true,
              contentPadding:
              EdgeInsets.only(left: 23.h, top: 17.v, bottom: 17.v))
        ]));
  }

  void _handleSignIn(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        // Sign in with Firebase Auth
        UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: johnController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Handle successful sign-in, e.g., navigate to welcome screen
        Navigator.pushNamed(context, AppRoutes.userAndNgoWelcomeScreen);
      } on FirebaseAuthException catch (e) {
        // Handle errors, e.g., display an error message
        print("Failed to sign in: $e");
        // You can display an error message to the user here.
      }
    }
  }

  /// Navigates to the signInDisabledScreen when the action is triggered.
  onTapUser(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signInDisabledScreen);
  }

  /// Navigates to the forgotPasswordScreen when the action is triggered.
  onTapTxtForgotpassword(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.forgotPasswordScreen);
  }

  /// Navigates to the userAndNgoWelcomeScreen when the action is triggered.
  onTapSignIn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.userAndNgoWelcomeScreen);
  }

  /// Navigates to the welcomePageOneScreen when the action is triggered.
  onTapTxtDonthaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.welcomePageOneScreen);
  }
}