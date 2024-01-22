import 'package:flutter/material.dart';

class AwesomeAlertTheme {
  static final AwesomeAlertTheme _instance = AwesomeAlertTheme.internal();

  factory AwesomeAlertTheme() => _instance;

  AwesomeAlertTheme.internal();

  Color? progressColor;
  Color? confirmButtonColor;
  Color? cancelButtonColor;
  TextStyle? titleStyle;
  TextStyle? descriptionStyle;
  TextStyle? confirmButtonTextStyle;
  TextStyle? cancelButtonTextStyle;
  TextAlign? textAlignDescription;
}
