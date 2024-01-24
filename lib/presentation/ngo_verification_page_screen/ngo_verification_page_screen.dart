import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton_one.dart';
import 'package:meal_connect/widgets/app_bar/appbar_title.dart';
import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

class NgoVerificationPageScreen extends StatelessWidget {
 NgoVerificationPageScreen({Key? key}) : super(key: key);

 TextEditingController nameController = TextEditingController();
 TextEditingController registrationnumberController = TextEditingController();
 TextEditingController dateController = TextEditingController();

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
      padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 8.v),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        SizedBox(height: 46.v),
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
        SizedBox(height: 40.v),
        Text(
         "NGO detail",
         style: CustomTextStyles.titleMediumBluegray900_1,
        ),
        SizedBox(height: 40.v),
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
        SizedBox(height: 46.v),
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
        SizedBox(height: 48.v),
        _buildDonationExpired(context),
        SizedBox(height: 66.v),
        CustomElevatedButton(
         width: 210.h,
         text: "Submit & Verify",
         margin: EdgeInsets.only(left: 62.h),
         buttonStyle: CustomButtonStyles.fillBlueGray,
         buttonTextStyle: CustomTextStyles.titleMediumMedium,
         onPressed: () async {
          await onTapSubmitVerify(context);
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

 Widget _buildDonationExpired(BuildContext context) {
  return Padding(
   padding: EdgeInsets.only(right: 14.h),
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     Padding(
      padding: EdgeInsets.only(left: 18.h),
      child: Row(
       children: [
        Padding(
         padding: EdgeInsets.only(top: 2.v),
         child: Text(
          "State",
          style: theme.textTheme.titleSmall,
         ),
        ),
        Padding(
         padding: EdgeInsets.only(bottom: 3.v),
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
      controller: dateController,
      hintText: "Donation Expired Date",
      textInputAction: TextInputAction.done,
     ),
    ],
   ),
  );
 }

 onTapUser(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.welcomePageOneScreen);
 }

 Future<void> onTapSubmitVerify(BuildContext context) async {
  bool isVerified = await verifyNgoDetails(
   name: nameController.text,
   registrationNumber: registrationnumberController.text,
   donationExpiredDate: dateController.text,
  );

  if (isVerified) {
   await saveNgoDetails();

   Navigator.pushNamed(context, AppRoutes.profileCreationScreen);
  } else {
   print('NGO verification failed');
   // Display an error message or take appropriate action
  }
 }

 Future<bool> verifyNgoDetails({
  required String name,
  required String registrationNumber,
  required String donationExpiredDate,
 }) async {
  DatabaseReference ngosRef =
  FirebaseDatabase.instance.reference().child('1dV6ovTWO1qAeHRk2feh-1L15cnk0lfzCBAjeN2ftl2s').child('Sheet1').child('1');

  DatabaseEvent event = await ngosRef.once();
  DataSnapshot snapshot = event.snapshot;

  Map<dynamic, dynamic>? values = snapshot.value as Map<dynamic, dynamic>?;

  if (values != null) {
   var ngo = values;
   if (ngo['ngo_name'] == name &&
       ngo['reg_no'] == registrationNumber) {
    return true;
   }
  }

  return false;
 }

 Future<void> saveNgoDetails() async {
  DatabaseReference newNgoRef =
  FirebaseDatabase.instance.reference().child('new_ngos');

  await newNgoRef.push().set({
   'name': nameController.text,
   'registrationNumber': registrationnumberController.text,
   'donationExpiredDate': dateController.text,
  });
 }
}
