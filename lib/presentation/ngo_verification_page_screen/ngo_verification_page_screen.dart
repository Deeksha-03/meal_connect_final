import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meal_connect/core/models/user_model.dart';
import 'package:meal_connect/core/models/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController {
 static SignUpController get instance => Get.find();

 final userRepo = Get.put(UserRepository());

 Future <void> createUser(UserModel user) async{
  await userRepo.createUser(user);
 }
}

class NgoVerificationPageScreen extends StatefulWidget {
 NgoVerificationPageScreen({Key? key}) : super(key: key);

 @override
 _NgoVerificationPageScreenState createState() =>
     _NgoVerificationPageScreenState();
}

class _NgoVerificationPageScreenState extends State<NgoVerificationPageScreen> {

 final signUpController = Get.put(SignUpController());

 TextEditingController nameController = TextEditingController();
 TextEditingController registrationnumberController = TextEditingController();
 TextEditingController dateController = TextEditingController();
 TextEditingController emailController = TextEditingController();

 TextEditingController emailController1 = TextEditingController();

 TextEditingController emailController2 = TextEditingController();

 TextEditingController passwordController = TextEditingController();

 TextEditingController passwordController1 = TextEditingController();

 final typeController = "ngo";

 GlobalKey<FormState> _formKey = GlobalKey<FormState>();

 @override
 Widget build(BuildContext context) {
  return SafeArea(
   child: Scaffold(
    resizeToAvoidBottomInset: true,
    appBar: _buildAppBar(context),
    body: Form(
     key: _formKey,
     child: Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 8.v),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        SizedBox(height: 26.v),
        Container(
         width: 329.h,
         margin: EdgeInsets.only(left: 7.h, right: 37.h),
         child: Text(
          "Provide your name and registration number as per NGO Darpan for verification.",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CustomTextStyles.titleSmallGray500_1,
         ),
        ),
        SizedBox(height: 20.v),
        Text(
         "NGO detail",
         style: CustomTextStyles.titleMediumBluegray900_1,
        ),
        SizedBox(height: 30.v),
        Padding(
         padding: EdgeInsets.only(left: 18.h),
         child: Row(
          children: [
           Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text(
             "NGO name",
             style: theme.textTheme.titleSmall,
            ),
           ),
           Padding(
            padding: EdgeInsets.only(left: 2.h, bottom: 3.v),
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
         padding: EdgeInsets.only(right: 14.h),
         child: CustomTextFormField(
          controller: nameController,
          hintText: "Enter NGO’s name as registered",
         ),
        ),
        SizedBox(height: 30.v),
        Padding(
         padding: EdgeInsets.only(left: 18.h),
         child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
            padding: EdgeInsets.only(top: 6.v),
            child: Text(
             "Registration No",
             style: theme.textTheme.titleSmall,
            ),
           ),
           Padding(
            padding: EdgeInsets.only(left: 5.h, bottom: 7.v),
            child: Text(
             "*",
             style: theme.textTheme.bodyMedium,
            ),
           ),
          ],
         ),
        ),
        SizedBox(height: 7.v),
        Padding(
         padding: EdgeInsets.only(right: 14.h),
         child: CustomTextFormField(
          controller: registrationnumberController,
          hintText: "Registration number ",
          textInputType: TextInputType.number,
         ),
        ),
        SizedBox(height: 36.v),
        _buildEmail(context),
        SizedBox(height: 12.v),
        _buildPassword(context),
        SizedBox(height: 12.v),
        _buildPassword1(context),
        SizedBox(height: 26.v),
        CustomElevatedButton(
         width: 210.h,
         text: "Submit & Verify",
         margin: EdgeInsets.only(left: 62.h),
         buttonStyle: CustomButtonStyles.fillBlueGray,
         buttonTextStyle: CustomTextStyles.titleMediumMedium,
         onPressed: () async {
          await onTapSubmitVerify(context);
          if (_formKey.currentState!.validate()) {
           try {
            // Register user with email and password
            await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
             email: emailController1.text,
             password: passwordController.text,
            );
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('reg_no', registrationnumberController.text.trim());
            prefs.setString('ngo_name', nameController.text.trim());

            // User registration successful
            // Store additional user information in Firestore
            // await FirebaseFirestore.instance
            //     .collection('users')
            //     .doc(emailController1
            //     .text) // Use email as the document ID
            //     .set({
            //  'username': nameController.text,
            //  'email': emailController1.text,
            //  'password': passwordController.text,
            // });
            final user = UserModel(email: emailController1.text.trim(),
                name: nameController.text.trim(),
                password: passwordController.text.trim(),
                type: typeController);
            signUpController.createUser(user);

            // Navigate to the next screen
            //Navigator.pushNamed(context, '/select_location_screen');
           } catch (e) {
            // Handle registration errors
            print("Error: Some error occurred during signing in");
           }
          }
         },
        ),
        Spacer(),
        SizedBox(
         width: 249.h,
         child: Divider(
          color: appTheme.blueGray900,
          indent: 105.h,
         ),
        ),
       ],
      ),
     ),
    ),
   ),
  );
 }


 PreferredSizeWidget _buildAppBar(BuildContext context) {
  return CustomAppBar(
   leadingWidth: 55.h,
   leading: AppbarLeadingIconbuttonOne(
    imagePath: ImageConstant.imgUser,
    margin: EdgeInsets.only(left: 24.h, top: 7.v, bottom: 17.v),
    onTap: () {
     onTapUser(context);
    },
   ),
   title: AppbarTitle(
    text: "Verify using NGO darpan",
    margin: EdgeInsets.only(left: 25.h),
   ),
  );
 }


 Widget _buildEmail(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Padding(
       padding: EdgeInsets.only(left: 18.h),
       child: Row(children: [
        Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text("Email", style: theme.textTheme.titleSmall)),
        Padding(
            padding: EdgeInsets.only(left: 2.h, bottom: 3.v),
            child: Text("*", style: theme.textTheme.bodyMedium))
       ])),
   SizedBox(height: 9.v),
   CustomTextFormField(
       controller: emailController1,
       hintText: "Enter your email",
       textInputType: TextInputType.emailAddress)
  ]);
 }

 Widget _buildPassword(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
       hintText: "Enter your password",
       textInputType: TextInputType.visiblePassword,
       suffix: Container(
           margin: EdgeInsets.fromLTRB(30.h, 13.v, 27.h, 11.v),
           child: CustomImageView(
               imagePath: ImageConstant.imgAntdesigneyeinvisiblefilled,
               height: 28.adaptSize,
               width: 28.adaptSize)),
       suffixConstraints: BoxConstraints(maxHeight: 52.v),
       obscureText: true,
       contentPadding: EdgeInsets.only(left: 23.h, top: 17.v, bottom: 17.v))
  ]);
 }

 Widget _buildPassword1(BuildContext context) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
   Padding(
       padding: EdgeInsets.only(left: 19.h),
       child: Row(children: [
        Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Text("Confirm Password ",
                style: theme.textTheme.titleSmall)),
        Padding(
            padding: EdgeInsets.only(left: 2.h, bottom: 3.v),
            child: Text("*", style: theme.textTheme.bodyMedium))
       ])),
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
                   width: 28.adaptSize)),
           suffixConstraints: BoxConstraints(maxHeight: 52.v),
           obscureText: true,
           contentPadding:
           EdgeInsets.only(left: 23.h, top: 17.v, bottom: 17.v)))
  ]);

 }

 onTapUser(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.welcomePageOneScreen);
 }

 Future<void> onTapSubmitVerify(BuildContext context) async {
  bool isVerified = await verifyNgoDetails(
   name: nameController.text,
   registrationNumber: registrationnumberController.text,

   //donationExpiredDate: dateController.text,

  );

  if (isVerified) {
   await saveNgoDetails();

   Navigator.pushNamed(context, AppRoutes.successfulScreen);
  } else {
   print('NGO verification failed');
   // Display an error message or take appropriate action
  }
 }

 Future<bool> verifyNgoDetails({
  required String name,
  required String registrationNumber,

  //required String donationExpiredDate,
 }) async {
  DatabaseReference ngosRef = FirebaseDatabase.instance
      .ref()
      .child('1dV6ovTWO1qAeHRk2feh-1L15cnk0lfzCBAjeN2ftl2s')
      .child('Sheet1');


  DatabaseEvent event = await ngosRef.once();
  DataSnapshot snapshot = event.snapshot;

  List<dynamic>? values = snapshot.value as List<dynamic>?;

  if (values != null) {
   for (var entry in values) {
    if (entry is Map<dynamic, dynamic>) {
     //print("Database Entry: $entry");


     print(
         "Name Type: ${entry['ngo_name'].runtimeType}, Value: ${entry['ngo_name']}");
     print(
         "Registration Number Type: ${entry['registration_number'].runtimeType}, Value: ${entry['registration_number']}");

     if (entry['ngo_name'] == name &&
         entry['registration_number'] == registrationNumber) {

      return true;
     }
    }
   }
  }

  // If no match is found after checking all entries, return false
  return false;
 }


 Future<void> saveNgoDetails() async {
  DatabaseReference newNgoRef =
  FirebaseDatabase.instance.ref().child('verified_ngos');


  await newNgoRef.push().set({
   'name': nameController.text,
   'registrationNumber': registrationnumberController.text,

   //'donationExpiredDate': dateController.text,
  });
 }
}

