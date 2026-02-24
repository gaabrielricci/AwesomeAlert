import 'package:flutter/material.dart';

/// [AwesomeAlertTheme] is a singleton class used to manage global styling for all alerts.
///
/// You can customize colors, text styles, and dimensions here to maintain consistency
/// across your application.
///
/// Example:
/// ```dart
/// AwesomeAlertTheme().progressColor = Colors.red;
/// AwesomeAlertTheme().borderRadius = 20.0;
/// ```
class AwesomeAlertTheme {
  /// Private constructor for singleton pattern.
  AwesomeAlertTheme._internal();

  /// The shared instance of [AwesomeAlertTheme].
  static final AwesomeAlertTheme _instance = AwesomeAlertTheme._internal();

  /// Returns the singleton instance of [AwesomeAlertTheme].
  factory AwesomeAlertTheme() => _instance;

  /// Color for the progress indicator in loading alerts.
  Color? progressColor;

  /// Default color for the confirm button.
  Color? confirmButtonColor;

  /// Default color for the cancel button.
  Color? cancelButtonColor;

  /// Default [TextStyle] for the alert title.
  TextStyle? titleStyle;

  /// Default [TextStyle] for the alert description.
  TextStyle? descriptionStyle;

  /// Default [TextStyle] for the confirm button text.
  TextStyle? confirmButtonTextStyle;

  /// Default [TextStyle] for the cancel button text.
  TextStyle? cancelButtonTextStyle;

  /// Default height for buttons in the alert.
  double? buttonHeight;

  /// Default border radius for buttons in the alert.
  double? buttonRadius;

  /// Default padding for the alert dialog itself.
  double? defaultPaddingAlert;

  /// Default internal padding for the alert body content.
  double? internalBodyPadding;

  /// Optional maximum width for the alert dialog on large screens.
  double? fixedSize;

  /// Default border radius for the alert dialog corners. Defaults to 12.
  double borderRadius = 12;

  /// Default text alignment for the alert description.
  TextAlign? textAlignDescription;
}

