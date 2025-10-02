import 'dart:io';

import 'package:awesome_alert/awesome_theme.dart';
import 'package:flutter/material.dart';

class TextMobile extends StatelessWidget {
  const TextMobile({super.key, required this.description, this.descriptionStyle, this.textAlignDescription});

  final String description;
  final TextStyle? descriptionStyle;
  final TextAlign? textAlignDescription;
  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? SelectableText(
      description,
      style: descriptionStyle ??
          AwesomeAlertTheme().descriptionStyle ??
          const TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
      textAlign: textAlignDescription ?? AwesomeAlertTheme().textAlignDescription ?? TextAlign.center,
    )
        : Text(
      description,
      style: descriptionStyle ??
          AwesomeAlertTheme().descriptionStyle ??
          const TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
      textAlign: textAlignDescription ?? AwesomeAlertTheme().textAlignDescription ?? TextAlign.center,
    );
  }
}
