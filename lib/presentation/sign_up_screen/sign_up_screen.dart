import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_two.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title_image.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_icon_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in_android/google_sign_in_android.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController emailController = TextEditingController();

  TextEditingController emailController1 = TextEditingController();

  TextEditingController emailController2 = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController passwordController1 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                _buildMainStack(context),
                SizedBox(height: 2.v),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 33.h,
                        right: 33.h,
                        bottom: 5.v,
                      ),
                      child: Column(
                        children: [
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
                                        right: 7.h,
                                        bottom: 6.v,
                                      ),
                                    ),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgVectorBlue60019x19,
                                      height: 19.adaptSize,
                                      width: 19.adaptSize,
                                      alignment: Alignment.bottomLeft,
                                    ),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgVectorBlue60016x22,
                                      height: 15.v,
                                      width: 18.h,
                                      alignment: Alignment.topRight,
                                    ),
                                    CustomImageView(
                                      imagePath:
                                          ImageConstant.imgVectorBlue60013x14,
                                      height: 13.v,
                                      width: 14.h,
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.only(
                                        left: 5.h,
                                        top: 10.v,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              CustomImageView(
                                imagePath: ImageConstant.imgVectorBlue60019x19,
                                height: 8.adaptSize,
                                width: 8.adaptSize,
                                margin: EdgeInsets.only(
                                  top: 110.v,
                                  bottom: 5.v,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 9.v),
                          CustomImageView(
                            imagePath: ImageConstant.imgVectorBlue60019x19,
                            height: 4.adaptSize,
                            width: 4.adaptSize,
                          ),
                          SizedBox(height: 38.v),
                          Text(
                            "Start your journey",
                            style: theme.textTheme.headlineSmall,
                          ),
                          SizedBox(height: 38.v),
                          _buildUsername(context),
                          SizedBox(height: 32.v),
                          _buildEmail(context),
                          SizedBox(height: 32.v),
                          _buildPhone(context),
                          SizedBox(height: 32.v),
                          _buildPassword(context),
                          SizedBox(height: 32.v),
                          _buildPassword1(context),
                          SizedBox(height: 56.v),
                          CustomElevatedButton(
                            text: "Sign Up",
                            margin: EdgeInsets.only(
                              left: 13.h,
                              right: 19.h,
                            ),
                            // FIREBASE CODE
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  // Register user with email and password
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController1.text,
                                    password: passwordController.text,
                                  );

                                  // User registration successful
                                  // Store additional user information in Firestore
                                  await FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(emailController1.text) // Use email as the document ID
                                      .set({
                                    'username': emailController.text,
                                    'email': emailController1.text,
                                    'phone': emailController2,
                                    'password': passwordController.text,
                                  });

                                  // Navigate to the next screen
                                  Navigator.pushNamed(context, AppRoutes.userAndNgoWelcomeScreen);
                                } catch (e) {
                                  // Handle registration errors
                                  print("Error: Some error occurred during signing in");
                                }
                              }
                            },
                          ),
                          SizedBox(height: 29.v),
                          Text(
                            "Or continue with",
                            style: CustomTextStyles.titleSmallBlack900_1,
                          ),
                          SizedBox(height: 24.v),
                          CustomIconButton(
                            height: 49.adaptSize,
                            width: 49.adaptSize,
                            padding: EdgeInsets.all(11.h),
                            decoration: IconButtonStyleHelper.outlineGray,
                            child: CustomImageView(
                              imagePath: ImageConstant.imgFlatColorIconsGoogle,
                            ),
                            onTap: () async {
                              final UserCredential? user = await _signInWithGoogle();
                              if (user != null) {
                                Navigator.pushNamed(context, AppRoutes.userAndNgoWelcomeScreen);
                              } else {
                                print("Error: Some error occurred during signing in");
                              }
                            },
                          ),
                          SizedBox(height: 27.v),
                          SizedBox(
                            width: 167.h,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account?\n ",
                                    style:
                                        CustomTextStyles.titleSmallBlack900_3,
                                  ),
                                  TextSpan(
                                    text: "Sign in",
                                    style: CustomTextStyles
                                        .titleSmallPrimaryBold_2,
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
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
      ),
    );
  }
  Future<UserCredential?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? gUser = await _googleSignIn.signIn();
      if (gUser != null) {
        final GoogleSignInAuthentication gAuth = await gUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        /*final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        return user;*/
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } catch (error) {
      print('Google sign-in error: $error');
      return null;
    }
  }
  /// Section Widget
  Widget _buildMainStack(BuildContext context) {
    return SizedBox(
      height: 69.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 64.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          CustomAppBar(
            height: 34.v,
            leadingWidth: 55.h,
            leading: AppbarLeadingIconbuttonTwo(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.only(left: 24.h),
            ),
            centerTitle: true,
            title: AppbarTitleImage(
              imagePath: ImageConstant.imgVectorBlue60013x14,
              margin: EdgeInsets.only(bottom: 21.v),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUsername(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "Username",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 4.h,
                  bottom: 3.v,
                ),
                child: Text(
                  "*",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: emailController,
          hintText: "Enter your email",
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "Email",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  bottom: 3.v,
                ),
                child: Text(
                  "*",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: emailController1,
          hintText: "Enter your email",
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildPhone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "Phone No.",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  bottom: 3.v,
                ),
                child: Text(
                  "*",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: emailController2,
          hintText: "Enter your Phone Number",
          textInputType: TextInputType.phone,
        ),
      ],
    );
  }



  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "Password",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 3.h,
                  bottom: 3.v,
                ),
                child: Text(
                  "*",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 9.v),
        CustomTextFormField(
          controller: passwordController,
          hintText: "Enter your password",
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 13.v, 27.h, 11.v),
            child: CustomImageView(
              imagePath: ImageConstant.imgAntdesigneyeinvisiblefilled,
              height: 28.adaptSize,
              width: 28.adaptSize,
            ),
          ),
          suffixConstraints: BoxConstraints(
            maxHeight: 52.v,
          ),
          obscureText: true,
          contentPadding: EdgeInsets.only(
            left: 23.h,
            top: 17.v,
            bottom: 17.v,
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildPassword1(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 19.h),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 2.v),
                child: Text(
                  "Confirm Password ",
                  style: theme.textTheme.titleSmall,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  bottom: 3.v,
                ),
                child: Text(
                  "*",
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 9.v),
        Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: CustomTextFormField(
            controller: passwordController1,
            hintText: "Enter your password",
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 13.v, 27.h, 11.v),
              child: CustomImageView(
                imagePath: ImageConstant.imgAntdesigneyeinvisiblefilled,
                height: 28.adaptSize,
                width: 28.adaptSize,
              ),
            ),
            suffixConstraints: BoxConstraints(
              maxHeight: 52.v,
            ),
            obscureText: true,
            contentPadding: EdgeInsets.only(
              left: 23.h,
              top: 17.v,
              bottom: 17.v,
            ),
          ),
        ),
      ],
    );
  }
}
