import 'package:awesome_alert/awesome_theme.dart';
import 'package:awesome_alert/widgets/platform_text/mobile/text_mobile.dart';
import 'package:awesome_alert/widgets/platform_text/web/text_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

/// A widget to display the default body of an alert dialog, including title, description, and action buttons.
class BodyDefaultAlert extends StatelessWidget {
  const BodyDefaultAlert({
    super.key,
    required this.title,
    required this.description,
    this.confirmButtonColor,
    this.cancelButtonColor,
    this.titleStyle,
    this.descriptionStyle,
    this.confirmButtonTextStyle,
    this.cancelButtonTextStyle,
    this.textAlignDescription,
    this.body,
    this.cancelText,
    this.cancelAction,
    required this.heightButtons,
    required this.buttonCornerRadius,
    required this.cornerRadius,
    required this.confirmText,
    required this.confirmAction,
    this.isHtml = false,
    this.close,
  });

  final String confirmText;
  final VoidCallback confirmAction;
  final String title;
  final String description;
  final Widget? body;
  final String? cancelText;
  final VoidCallback? cancelAction;
  final double cornerRadius;
  final double buttonCornerRadius;
  final double heightButtons;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? confirmButtonTextStyle;
  final TextStyle? cancelButtonTextStyle;
  final TextAlign? textAlignDescription;
  final bool isHtml;
  final VoidCallback? close;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Title area
        Row(
          children: [
            if (close != null) const SizedBox(width: 25),
            Expanded(
              child: Text(
                title,
                style: titleStyle ??
                    AwesomeAlertTheme().titleStyle ??
                    const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 22,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            if (close != null)
              IconButton(
                onPressed: close,
                icon: const Icon(Icons.close, color: Colors.red),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
          ],
        ),
        const SizedBox(height: 20),

        // Description
        Flexible(
          child: SingleChildScrollView(
            child: isHtml
                ? HtmlWidget(
                    description,
                    textStyle: descriptionStyle ??
                        const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                  )
                : kIsWeb
                    ? TextWeb(
                        description: description,
                        textAlignDescription: textAlignDescription,
                        descriptionStyle: descriptionStyle,
                      )
                    : TextMobile(
                        description: description,
                        textAlignDescription: textAlignDescription,
                        descriptionStyle: descriptionStyle,
                      ),
          ),
        ),

        if (body != null) ...[
          const SizedBox(height: 20),
          body!,
        ],

        const SizedBox(height: 20),

        // Buttons
        Row(
          children: [
            if (cancelText != null && cancelAction != null)
              Expanded(
                child: MaterialButton(
                  onPressed: cancelAction,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AwesomeAlertTheme().buttonRadius ?? buttonCornerRadius)),
                  height: AwesomeAlertTheme().buttonHeight ?? heightButtons,
                  color: cancelButtonColor ?? AwesomeAlertTheme().cancelButtonColor ?? Theme.of(context).colorScheme.error,
                  child: Text(
                    cancelText!,
                    style: cancelButtonTextStyle ??
                        AwesomeAlertTheme().cancelButtonTextStyle ??
                        const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
            if (cancelText != null && cancelAction != null) const SizedBox(width: 10),
            Expanded(
              child: MaterialButton(
                onPressed: confirmAction,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AwesomeAlertTheme().buttonRadius ?? buttonCornerRadius)),
                height: AwesomeAlertTheme().buttonHeight ?? heightButtons,
                color: confirmButtonColor ?? AwesomeAlertTheme().confirmButtonColor ?? Theme.of(context).colorScheme.primary,
                child: Text(
                  confirmText,
                  style: confirmButtonTextStyle ??
                      AwesomeAlertTheme().confirmButtonTextStyle ??
                      const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

