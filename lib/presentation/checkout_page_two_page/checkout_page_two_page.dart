import 'package:firebase_database/firebase_database.dart';

import '../checkout_page_two_page/widgets/eightythree_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

class CheckoutPageTwoPage extends StatefulWidget {
  const CheckoutPageTwoPage({Key? key}) : super(key: key);

  @override
  CheckoutPageTwoPageState createState() => CheckoutPageTwoPageState();
}

// ignore_for_file: must_be_immutable
class CheckoutPageTwoPageState extends State<CheckoutPageTwoPage>
    with AutomaticKeepAliveClientMixin<CheckoutPageTwoPage> {
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DatabaseReference dbRef;

  @override
  void initState(){
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Order');
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: [
                  SizedBox(height: 28.v),
                  Padding(
                      padding: EdgeInsets.only(left: 33.h, right: 37.h),
                      child: Column(children: [
                        SizedBox(height: 73.v),
                        _buildDonationFormSection(context)
                      ]))
                ])))));
  }

  /// Section Widget


  /// Section Widget
  Widget _buildSelectCampaignSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("Date", style: theme.textTheme.titleSmall)),
          SizedBox(height: 12.v),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: CustomTextFormField(
                  controller: dateController,
                  hintText: "Expected Date",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 23.h, vertical: 13.v)))
        ]));
  }

  /// Section Widget
  Widget _buildTimeSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("Time", style: theme.textTheme.titleSmall)),
          SizedBox(height: 12.v),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: CustomTextFormField(
                  controller: timeController,
                  hintText: "Expected Time",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 23.h, vertical: 13.v)))
        ]));
  }

  /// Section Widget
  Widget _buildDonationExpiredSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child:
                  Text("Point of Contact", style: theme.textTheme.titleSmall)),
          SizedBox(height: 12.v),
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: CustomTextFormField(
                  controller: phoneNumberController,
                  hintText: "Phone number",
                  textInputType: TextInputType.phone,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 23.h, vertical: 13.v)))
        ]
        )
    );
  }

  /// Section Widget
  Widget _buildDonationFormSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 39.h, vertical: 26.v),
        decoration: AppDecoration.outlineBlack9004
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder8),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text("Provide Details",
              style: CustomTextStyles.titleMediumBluegray900Bold),
          SizedBox(height: 20.v),
          _buildSelectCampaignSection(context),
          SizedBox(height: 21.v),
          _buildTimeSection(context),
          SizedBox(height: 21.v),
          _buildDonationExpiredSection(context),
          SizedBox(height: 17.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 13.h),
                  child: Text("Address", style: theme.textTheme.titleSmall))),
          SizedBox(height: 10.v),
          Padding(
              padding: EdgeInsets.only(left: 13.h),
              child: CustomTextFormField(
                  controller: addressController,
                  hintText: "Full Address",
                  textInputAction: TextInputAction.done,
                  maxLines: 6)),
          SizedBox(height: 13.v),
          CustomElevatedButton(
              height: 36.v,
              text: "DONATE NOW",
              margin: EdgeInsets.only(left: 42.h, right: 34.h),
              buttonStyle: CustomButtonStyles.fillPrimaryTL10,
              buttonTextStyle:
                  CustomTextStyles.labelMediumOnPrimaryContainerBold,
              onPressed: () {
                Map<String,String> order ={
                  'date':dateController.text,
                  'time':timeController.text,
                  'phno':phoneNumberController.text,
                  'address':addressController.text,
                };
                dbRef.push().set(order);
                onTapDONATENOW(context);
              }),
          SizedBox(height: 5.v)
        ]));
  }

  /// Navigates to the successfulTwoScreen when the action is triggered.
  onTapDONATENOW(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successfulTwoScreen);
  }
}
