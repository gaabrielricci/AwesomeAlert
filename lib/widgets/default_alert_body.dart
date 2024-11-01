import 'package:awesome_alert/awesome_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

/// A widget to display the default body of an alert dialog, including title, description, and action buttons.
class BodyDefaultAlert extends StatelessWidget {
  const BodyDefaultAlert({
    super.key,
    required this.title, // Title of the alert.
    required this.description, // Description text of the alert.
    this.confirmButtonColor, // Optional color for the confirm button.
    this.cancelButtonColor, // Optional color for the cancel button.
    this.titleStyle, // Optional style for the title text.
    this.descriptionStyle, // Optional style for the description text.
    this.confirmButtonTextStyle, // Optional style for the confirm button text.
    this.cancelButtonTextStyle, // Optional style for the cancel button text.
    this.textAlignDescription, // Optional text alignment for the description.
    this.body, // Optional additional body widget.
    this.cancelText, // Optional text for the cancel button.
    this.cancelAction, // Optional function to call when the cancel button is pressed.
    required this.paddingScreen, // Padding around the alert dialog.
    required this.heightButtons, // Height of the buttons.
    required this.buttonCornerRadius, // Radius for rounding the corners of the buttons.
    required this.cornerRadius, // Radius for rounding the corners of the alert dialog.
    required this.paddingBody, // Padding inside the alert body.
    required this.confirmText, // Text for the confirm button.
    required this.confirmAction, // Function to call when the confirm button is pressed.
    this.isHtml, // Optional flag to indicate if the description should be rendered as HTML.
    this.close, //optional close function
  });

  final String confirmText; // Text for the confirm button.
  final Function confirmAction; // Function to call when the confirm button is pressed.
  final String title; // Title of the alert.
  final String description; // Description text of the alert.
  final Widget? body; // Optional additional body widget.
  final String? cancelText; // Optional text for the cancel button.
  final Function? cancelAction; // Optional function to call when the cancel button is pressed.
  final double cornerRadius; // Radius for rounding the corners of the alert dialog.
  final double paddingBody; // Padding inside the alert body.
  final double paddingScreen; // Padding around the alert dialog.
  final double buttonCornerRadius; // Radius for rounding the corners of the buttons.
  final double heightButtons; // Height of the buttons.
  final Color? confirmButtonColor; // Optional color for the confirm button.
  final Color? cancelButtonColor; // Optional color for the cancel button.
  final TextStyle? titleStyle; // Optional style for the title text.
  final TextStyle? descriptionStyle; // Optional style for the description text.
  final TextStyle? confirmButtonTextStyle; // Optional style for the confirm button text.
  final TextStyle? cancelButtonTextStyle; // Optional style for the cancel button text.
  final TextAlign? textAlignDescription; // Optional text alignment for the description.
  final bool? isHtml; // Optional flag to render the description as HTML.
  final Function? close; // close alert

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Always visible title.
        Row(
          children: [
            SizedBox(width: 25),
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
            close != null
                ? InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () {
                      if (close != null) {
                        close!();
                      }
                    },
                    child: Ink(
                      color: Colors.white,
                      child: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                  )
                : SizedBox()
          ],
        ),
        const SizedBox(height: 20),

        // Description with scrolling capability.
        Flexible(
          child: SingleChildScrollView(
            child: isHtml == true
                ? HtmlWidget(
                    description, // HTML content to be displayed.
                    textStyle: descriptionStyle ??
                        const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                  )
                : SelectableText(
                    description,
                    style: descriptionStyle ??
                        AwesomeAlertTheme().descriptionStyle ??
                        const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                        ),
                    textAlign: textAlignDescription ?? AwesomeAlertTheme().textAlignDescription ?? TextAlign.center,
                  ),
          ),
        ),

        const SizedBox(height: 20),

        // Additional body widget, if provided.
        body ?? const SizedBox(),
        SizedBox(height: body != null ? 20 : 0),

        // Always visible buttons.
        Row(
          children: [
            cancelText != null && cancelAction != null
                ? Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        if (cancelAction != null) cancelAction!();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AwesomeAlertTheme().buttonRadius ?? buttonCornerRadius)),
                      height: AwesomeAlertTheme().buttonHeight ?? heightButtons,
                      color: cancelButtonColor ?? AwesomeAlertTheme().cancelButtonColor ?? Theme.of(context).colorScheme.error,
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
                  confirmAction(); // Call the confirm action when the confirm button is pressed.
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AwesomeAlertTheme().buttonRadius ?? buttonCornerRadius)),
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
