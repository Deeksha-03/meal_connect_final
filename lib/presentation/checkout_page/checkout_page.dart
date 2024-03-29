import '../checkout_page/widgets/thirtyfour_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';
import 'package:meal_connect/widgets/custom_text_form_field.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  CheckoutPageState createState() => CheckoutPageState();
}

// ignore_for_file: must_be_immutable
class CheckoutPageState extends State<CheckoutPage>
    with AutomaticKeepAliveClientMixin<CheckoutPage> {
  TextEditingController timeController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                        _buildKgSection(context),
                        SizedBox(height: 73.v),
                        _buildDonationFormSection(context)
                      ]))
                ])))));
  }

  /// Section Widget
  Widget _buildKgSection(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 46.h),
        child: Column(children: [
          Wrap(
              runSpacing: 10.64.v,
              spacing: 10.64.h,
              children:
                  List<Widget>.generate(6, (index) => ThirtyfourItemWidget())),
          SizedBox(height: 29.v),
          Container(
              width: 266.h,
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.v),
              decoration: AppDecoration.outlinePrimary
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
              child: Text("Custom Amount",
                  style: CustomTextStyles.labelMediumPrimary))
        ]));
  }

  /// Section Widget
  Widget _buildSelectDateSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 9.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(left: 4.h),
              child: Text("Date", style: theme.textTheme.titleSmall)),
          SizedBox(height: 11.v),
          SizedBox(
              height: 37.v,
              width: 266.h,
              child: Stack(alignment: Alignment.centerRight, children: [
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 13.h, vertical: 9.v),
                        decoration: AppDecoration.outlineGray500.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Text("Select date",
                                      style: CustomTextStyles.labelMediumBold)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgArrowDown,
                                  height: 5.v,
                                  width: 12.h,
                                  margin: EdgeInsets.only(
                                      top: 5.v, right: 1.h, bottom: 5.v))
                            ]))),
                CustomImageView(
                    imagePath: ImageConstant.imgCalendar,
                    height: 20.adaptSize,
                    width: 20.adaptSize,
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(right: 49.h))
              ]))
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
  Widget _buildPointOfContactSection(BuildContext context) {
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
        ]));
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
          _buildSelectDateSection(context),
          SizedBox(height: 21.v),
          _buildTimeSection(context),
          SizedBox(height: 21.v),
          _buildPointOfContactSection(context),
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
