import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class CheckoutPageTwoPageState extends State<CheckoutPageTwoPage>
    with AutomaticKeepAliveClientMixin<CheckoutPageTwoPage>, TickerProviderStateMixin {
  late TabController tabviewController;
  TextEditingController noOfMealsController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late DatabaseReference dbRef;
  String contributor = "";
  String ngoSel = "";

  void fetchData() async {
    print("called2");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString('user_email');
    String? ngoName = prefs.getString('ngo_name_sel') ?? "";
    print(userName);
    print(ngoName);
    contributor = userName!;
    ngoSel = ngoName!;
    //return ngoName;
  }

  @override
  void initState(){
    super.initState();
    fetchData();
    dbRef = FirebaseDatabase.instance.ref().child('Order');
    tabviewController = TabController(length: 1, vsync: this);
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
                        SizedBox(height: 20.v),
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
          Column(

            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 0.v),
              Text(
                "Your Contribution",
                style:
                CustomTextStyles.titleMediumBluegray900Bold,
              ),
              SizedBox(height: 20.v),
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
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: tabviewController.index == 0
                              ? theme.colorScheme.primary
                              : Colors.transparent,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.h),
                            bottomLeft: Radius.circular(8.h),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "Number of meals",
                            style: TextStyle(
                              color: tabviewController.index == 0
                                  ? Colors.white
                                  : theme.colorScheme.primary,
                            ),
                          ),

                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 23.h, vertical: 20.v),
                child: CustomTextFormField(
                  controller: noOfMealsController,
                  hintText: "Number of meals",
                  textInputType: TextInputType.phone,
                ),
              ),
            ],

          ),
          SizedBox(height: 30.v),
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
                  'meals':  noOfMealsController.text,
                  'date':dateController.text,
                  'time':timeController.text,
                  'phno':phoneNumberController.text,
                  'address':addressController.text,
                  'ngoName': ngoSel,
                  'contributor': contributor,
                };
                dbRef.push().set(order);
                onTapDONATENOW(context);
              }),
          SizedBox(height: 5.v)
        ]));
  }

  /// Navigates to the successfulTwoScreen when the action is triggered.
  onTapDONATENOW(BuildContext context) {
    print("called");
    Navigator.pushNamed(context, AppRoutes.successfulTwoScreen);
  }
}
