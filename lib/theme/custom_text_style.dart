import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargePlusJakartaSansBluegray900 =>
      theme.textTheme.bodyLarge!.plusJakartaSans.copyWith(
        color: appTheme.blueGray900,
        fontSize: 16.fSize,
      );
  static get bodyLargePlusJakartaSansBluegray90016 =>
      theme.textTheme.bodyLarge!.plusJakartaSans.copyWith(
        color: appTheme.blueGray900,
        fontSize: 16.fSize,
      );
  // Headline text style
  static get headlineLargeExtraBold => theme.textTheme.headlineLarge!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get headlineMediumGray800 => theme.textTheme.headlineMedium!.copyWith(
        color: appTheme.gray800,
        fontSize: 28.fSize,
        fontWeight: FontWeight.w400,
      );
  static get headlineMediumPlusJakartaSansBluegray900 =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get headlineMediumPlusJakartaSansBluegray900ExtraBold =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w800,
      );
  static get headlineMediumPlusJakartaSansBluegray900SemiBold =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get headlineMediumPlusJakartaSansOnPrimaryContainer =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w200,
      );
  static get headlineMediumPlusJakartaSansPrimary =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get headlineMediumPlusJakartaSansPrimaryBold =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get headlineMediumPlusJakartaSansPrimarySemiBold =>
      theme.textTheme.headlineMedium!.plusJakartaSans.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get headlineMediumRegular => theme.textTheme.headlineMedium!.copyWith(
        fontSize: 28.fSize,
        fontWeight: FontWeight.w400,
      );
  static get headlineSmallCyan900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.cyan900,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallGray500 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get headlineSmallOnPrimary => theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallSemiBold => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get headlineSmallSemiBold_1 => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  // Label text style
  static get labelLargeBlack900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeBlack900Bold => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w700,
      );
  static get labelLargeBlack900_1 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.black900,
      );
  static get labelLargeBluegray900 => theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray900,
      );
  static get labelLargeBluegray900SemiBold =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w600,
      );
  static get labelLargeExtraBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w800,
      );
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get labelLargeOnPrimaryContainer =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w800,
      );
  static get labelLargePrimaryExtraBold => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 13.fSize,
        fontWeight: FontWeight.w800,
      );
  static get labelMediumBold => theme.textTheme.labelMedium!.copyWith(
        fontSize: 11.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumMedium => theme.textTheme.labelMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get labelMediumOnPrimaryContainer =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 11.fSize,
      );
  static get labelMediumOnPrimaryContainerBold =>
      theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumPrimary => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary.withOpacity(0.7),
        fontSize: 11.fSize,
        fontWeight: FontWeight.w700,
      );
  static get labelMediumPrimary11 => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 11.fSize,
      );
  static get labelMediumPrimary_1 => theme.textTheme.labelMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelMediumSFProTextBlack900 =>
      theme.textTheme.labelMedium!.sFProText.copyWith(
        color: appTheme.black900,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 16.fSize,
      );
  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumBlue600 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blue600,
      );
  static get titleMediumBluegray10002 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray10002,
      );
  static get titleMediumBluegray900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleMediumBluegray900Bold =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 19.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBluegray900Bold_1 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBluegray900Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumBluegray900_1 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray900,
      );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBold_1 => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static get titleMediumGray500 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray500Medium => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray500,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumGray700 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray700,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimaryBold => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimaryBold16 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumPrimaryExtraBold =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumPrimaryExtraBold17 =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 17.fSize,
        fontWeight: FontWeight.w800,
      );
  static get titleMediumPrimary_1 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallBlack900_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallBlack900_2 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallBlack900_3 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.black900,
      );
  static get titleSmallBlue600 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue600,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBlue600Bold => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blue600,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallBluegray100 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray100,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallBluegray10002 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray10002,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallGray500 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );
  static get titleSmallGray500_1 => theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray500,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleSmallPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallPrimaryBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimaryBold_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimaryBold_2 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static get titleSmallPrimarySemiBold => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static get titleSmallPrimary_1 => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallSemiBold => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
  static get titleSmallSemiBold_1 => theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get plusJakartaSans {
    return copyWith(
      fontFamily: 'Plus Jakarta Sans',
    );
  }

  TextStyle get sFProText {
    return copyWith(
      fontFamily: 'SF Pro Text',
    );
  }
}
