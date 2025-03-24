import 'package:flutter/material.dart';

/// Singleton class to manage the theme for AwesomeAlert.
class AwesomeAlertTheme {
  // Private constructor for internal use only.
  AwesomeAlertTheme._internal();

  // Singleton instance.
  static final AwesomeAlertTheme _instance = AwesomeAlertTheme._internal();

  // Factory constructor to return the singleton instance.
  factory AwesomeAlertTheme() => _instance;

  // Colors for various UI elements in the alert.
  Color? progressColor;
  Color? confirmButtonColor;
  Color? cancelButtonColor;
  TextStyle? titleStyle;
  TextStyle? descriptionStyle;
  TextStyle? confirmButtonTextStyle;
  TextStyle? cancelButtonTextStyle;
  double? buttonHeight;
  double? buttonRadius;
  double? defaultPaddingAlert;
  double? internalBodyPadding;
  double? fixedSize;
  double borderRadius=12;

  // Text alignment for the description.
  TextAlign? textAlignDescription;
}
