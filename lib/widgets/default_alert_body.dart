import 'package:awesome_alert/awesome_theme.dart';
import 'package:flutter/material.dart';

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
    required this.paddingScreen,
    required this.heightButtons,
    required this.buttonCornerRadius,
    required this.cornerRadius,
    required this.paddingBody,
    required this.confirmText,
    required this.confirmAction,
  });

  final String confirmText;
  final Function confirmAction;
  final String title;
  final String description;
  final Widget? body;
  final String? cancelText;
  final Function? cancelAction;
  final double cornerRadius;
  final double paddingBody;
  final double paddingScreen;
  final double buttonCornerRadius;
  final double heightButtons;
  final Color? confirmButtonColor;
  final Color? cancelButtonColor;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? confirmButtonTextStyle;
  final TextStyle? cancelButtonTextStyle;
  final TextAlign? textAlignDescription;

  @override
  Widget build(BuildContext context) {
    //this is the default body of showAlert.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
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
        const SizedBox(
          height: 20,
        ),
        SelectableText(
          description,
          style: descriptionStyle ??
              AwesomeAlertTheme().descriptionStyle ??
              const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
          textAlign: textAlignDescription ?? AwesomeAlertTheme().textAlignDescription ?? TextAlign.center,
        ),
        const SizedBox(height: 20),
        body ?? const SizedBox(),
        SizedBox(height: body != null ? 20 : 0),
        Row(
          children: [
            cancelText != null && cancelAction != null
                ? Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        if (cancelAction != null) cancelAction!();
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCornerRadius)),
                      height: heightButtons,
                      color: cancelButtonColor ??
                          AwesomeAlertTheme().cancelButtonColor ??
                          Theme.of(context).colorScheme.error,
                      child: Text(
                        cancelText ?? "",
                        style: cancelButtonTextStyle ??
                            AwesomeAlertTheme().cancelButtonTextStyle ??
                            const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                      ),
                    ),
                  )
                : const SizedBox(),
            Padding(padding: EdgeInsets.only(left: (cancelText != null && cancelAction != null) ? 10 : 0)),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  confirmAction();
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCornerRadius)),
                height: heightButtons,
                color: confirmButtonColor ??
                    AwesomeAlertTheme().confirmButtonColor ??
                    Theme.of(context).colorScheme.primary,
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
