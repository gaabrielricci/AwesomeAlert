import 'dart:io';

import 'package:awesome_alert/awesome_theme.dart';
import 'package:flutter/material.dart';

class TextWeb extends StatelessWidget {
  const TextWeb({super.key, required this.description, this.descriptionStyle, this.textAlignDescription});

  final String description;
  final TextStyle? descriptionStyle;
  final TextAlign? textAlignDescription;

  @override
  Widget build(BuildContext context) {
    return SelectableText(
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
