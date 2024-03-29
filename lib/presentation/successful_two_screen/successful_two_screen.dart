import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_connect/core/app_export.dart';
import 'package:meal_connect/widgets/custom_elevated_button.dart';

class SuccessfulTwoScreen extends StatelessWidget {
  const SuccessfulTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 49.h, vertical: 59.v),
          child: Column(
            children: [
              Spacer(flex: 33),
              CustomSvgImageView(
                svgPath: 'assets/images/img_group_2180.svg',
                height: 188.v,
                width: 194.h,
                alignment: Alignment.centerLeft,
              ),
              SizedBox(height: 33.v),
              Text("Successful! ", style: theme.textTheme.headlineLarge),
              SizedBox(height: 38.v),
              Container(
                width: 324.h,
                margin: EdgeInsets.only(right: 3.h),
                child: Text(
                  "Thank you for being a part of MealConnect.\nLet’s make a better world with us.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleMediumGray700.copyWith(height: 1.38),
                ),
              ),
              Spacer(flex: 66),
              CustomElevatedButton(
                text: "Continue",
                onPressed: () {
                  onTapContinue(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageExtendedOneScreen);
  }
}

class CustomSvgImageView extends StatelessWidget {
  final String svgPath;
  final double height;
  final double width;
  final Alignment alignment;
  final EdgeInsetsGeometry margin;

  const CustomSvgImageView({
    required this.svgPath,
    required this.height,
    required this.width,
    this.alignment = Alignment.center,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: SvgPicture.asset(
        svgPath,
        height: height,
        width: width,
        alignment: alignment,
      ),
    );
  }
}
