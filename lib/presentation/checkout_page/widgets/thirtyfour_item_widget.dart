import 'package:flutter/material.dart';
import 'package:meal_connect/core/app_export.dart';

// ignore: must_be_immutable
class ThirtyfourItemWidget extends StatelessWidget {
  const ThirtyfourItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 7.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "5 Kg",
        style: TextStyle(
          color: appTheme.gray500,
          fontSize: 11.459915161132812.fSize,
          fontFamily: 'Plus Jakarta Sans',
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      selectedColor: theme.colorScheme.onPrimaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: appTheme.blueGray100,
          width: 1.h,
        ),
        borderRadius: BorderRadius.circular(
          4.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
