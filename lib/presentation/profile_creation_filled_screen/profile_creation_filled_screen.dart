import 'package:dotted_border/dotted_border.dart';import 'package:flutter/material.dart';import 'package:meal_connect/core/app_export.dart';import 'package:meal_connect/widgets/app_bar/appbar_leading_iconbutton.dart';import 'package:meal_connect/widgets/app_bar/appbar_title.dart';import 'package:meal_connect/widgets/app_bar/custom_app_bar.dart';import 'package:meal_connect/widgets/custom_elevated_button.dart';import 'package:meal_connect/widgets/custom_text_form_field.dart';
// ignore_for_file: must_be_immutable
class ProfileCreationFilledScreen extends StatelessWidget {ProfileCreationFilledScreen({Key? key}) : super(key: key);

TextEditingController nameController = TextEditingController();

TextEditingController rAOvalueController = TextEditingController();

TextEditingController ourstoryvalueController = TextEditingController();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

@override Widget build(BuildContext context) { return SafeArea(child: Scaffold(resizeToAvoidBottomInset: false, appBar: _buildAppBar(context), body: Form(key: _formKey, child: SingleChildScrollView(padding: EdgeInsets.only(top: 30.v), child: Padding(padding: EdgeInsets.only(left: 35.h, right: 28.h, bottom: 5.v), child: Column(children: [_buildAddingPhoto(context), SizedBox(height: 66.v), Align(alignment: Alignment.centerLeft, child: Text("Campaign Details", style: CustomTextStyles.titleMediumBluegray900_1)), SizedBox(height: 63.v), _buildTitle(context), SizedBox(height: 46.v), _buildCategory(context), SizedBox(height: 48.v), _buildStory(context), SizedBox(height: 83.v), CustomElevatedButton(width: 210.h, text: "Submit & Create", buttonTextStyle: CustomTextStyles.titleMediumMedium, onPressed: () {onTapSubmitCreate(context);}, alignment: Alignment.centerRight), SizedBox(height: 48.v), SizedBox(width: 146.h, child: Divider(color: appTheme.blueGray900))])))))); } 
/// Section Widget
PreferredSizeWidget _buildAppBar(BuildContext context) { return CustomAppBar(height: 94.v, leadingWidth: 55.h, leading: AppbarLeadingIconbutton(imagePath: ImageConstant.imgRefresh, margin: EdgeInsets.only(left: 24.h, top: 30.v, bottom: 36.v), onTap: () {onTapRefresh(context);}), title: AppbarTitle(text: "Profile", margin: EdgeInsets.only(left: 25.h)), styleType: Style.bgFill); } 
/// Section Widget
Widget _buildAddingPhoto(BuildContext context) { return Padding(padding: EdgeInsets.only(right: 7.h), child: DottedBorder(color: appTheme.gray500, padding: EdgeInsets.only(left: 1.h, top: 1.v, right: 1.h, bottom: 1.v), strokeWidth: 1.h, radius: Radius.circular(20), borderType: BorderType.RRect, dashPattern: [5, 5], child: Container(width: 358.h, padding: EdgeInsets.symmetric(horizontal: 107.h, vertical: 65.v), decoration: AppDecoration.outlineGray.copyWith(borderRadius: BorderRadiusStyle.roundedBorder20), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Align(alignment: Alignment.center, child: Text("+", style: CustomTextStyles.headlineSmallSemiBold)), SizedBox(height: 12.v), Text("Add your image", style: CustomTextStyles.titleMediumGray500Medium)])))); } 
/// Section Widget
Widget _buildTitle(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 23.h), child: Row(children: [Padding(padding: EdgeInsets.only(top: 2.v), child: Text("NGO name", style: theme.textTheme.titleSmall)), Padding(padding: EdgeInsets.only(left: 2.h, bottom: 3.v), child: Text("*", style: theme.textTheme.bodyMedium))])), SizedBox(height: 9.v), Padding(padding: EdgeInsets.only(left: 5.h), child: CustomTextFormField(controller: nameController, hintText: "NGO name"))]); } 
/// Section Widget
Widget _buildCategory(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 23.h), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(top: 6.v), child: Text("Registration No", style: theme.textTheme.titleSmall)), Padding(padding: EdgeInsets.only(left: 5.h, bottom: 7.v), child: Text("*", style: theme.textTheme.bodyMedium))])), SizedBox(height: 7.v), Padding(padding: EdgeInsets.only(left: 5.h), child: CustomTextFormField(controller: rAOvalueController, hintText: "18RAO890"))]); } 
/// Section Widget
Widget _buildStory(BuildContext context) { return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.only(left: 23.h), child: Text("Bio", style: theme.textTheme.titleSmall)), SizedBox(height: 9.v), Padding(padding: EdgeInsets.only(left: 5.h), child: CustomTextFormField(controller: ourstoryvalueController, hintText: "Our story", textInputAction: TextInputAction.done, maxLines: 6, borderDecoration: TextFormFieldStyleHelper.outlineBlueGrayTL20))]); } 
/// Navigates to the profileCreationScreen when the action is triggered.
onTapRefresh(BuildContext context) { Navigator.pushNamed(context, AppRoutes.profileCreationScreen); } 
/// Navigates to the successfulOneScreen when the action is triggered.
onTapSubmitCreate(BuildContext context) { Navigator.pushNamed(context, AppRoutes.successfulOneScreen); } 
 }
