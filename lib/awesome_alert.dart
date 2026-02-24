import 'package:awesome_alert/awesome_theme.dart';
import 'package:awesome_alert/widgets/default_alert_body.dart';
import 'package:awesome_alert/widgets/image_alert_body.dart';
import 'package:flutter/material.dart';

/// [AwesomeAlert] is a powerful and flexible library for creating customized alerts in Flutter.
///
/// It supports standard alerts, loading indicators, image alerts, and list alerts.
/// Use the static methods like [AwesomeAlert.show] for the best experience.
///
/// Example:
/// ```dart
/// AwesomeAlert.show(
///   context,
///   title: "Success",
///   description: "Operation completed!",
///   confirmText: "OK",
///   confirmAction: () => print("Confirmed"),
/// );
/// ```
class AwesomeAlert {
  /// **LEGACY API** - Use [AwesomeAlert.show], [AwesomeAlert.showLoading], etc. for a more modern experience.
  ///
  /// Property Buildcontext. responsible for assigning context and allowing the alert to be inflated
  late BuildContext _context;

  /// **LEGACY API**
  ///
  /// Property that's controll the status of alert
  bool isOpened = false;

  /// **LEGACY API** - Will be removed in future versions.
  ///
  /// Use [AwesomeAlert.show(context, ...)] instead of instantiating the class.
  @Deprecated('Use AwesomeAlert.show(context, ...) instead of instantiating the class.')
  AwesomeAlert({required BuildContext context}) {
    _context = context;
  }

  /// **LEGACY API** - Use [Navigator.pop(context)] or let the alert close itself.
  ///
  /// This method is legacy and will be removed in future versions.
  @Deprecated('This method is legacy. Alerts now handle their own state better.')
  hideAlert() {
    if (isOpened) {
      isOpened = false;
      Navigator.canPop(_context) ? Navigator.pop(_context) : null;
    }
  }

  /// **LEGACY API** - Use [AwesomeAlert.show] instead.
  ///
  /// Shows a standard alert. This method requires an instance of [AwesomeAlert].
  @Deprecated('Use AwesomeAlert.show() instead.')
  void showAlert({
    required String title,
    required String description,
    required String confirmText,
    required Function confirmAction,
    Function? onComplete,
    Function? cancelAction,
    String? cancelText,
    Color? confirmButtonColor,
    Color? cancelButtonColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextStyle? confirmButtonTextStyle,
    TextStyle? cancelButtonTextStyle,
    TextAlign? textAlignDescription,
    Widget? body,
    bool cancelable = false,
    double? cornerRadius,
    double paddingBody = 15,
    double paddingScreen = 15,
    double buttonCornerRadius = 100,
    double heightButtons = 40,
    bool? isHtml = false,
    bool? closeButton = false,
    double? fixedSize,
  }) {
    hideAlert();
    isOpened = true;

    showDialog(
      barrierDismissible: cancelable,
      context: _context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: cancelable,
          child: Dialog(
            insetPadding: EdgeInsets.all(AwesomeAlertTheme().defaultPaddingAlert ?? paddingScreen),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
            ),
            child: ConstrainedBox(
              constraints: (fixedSize != null || AwesomeAlertTheme().fixedSize != null)
                  ? BoxConstraints(maxWidth: fixedSize ?? AwesomeAlertTheme().fixedSize ?? 700)
                  : BoxConstraints(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AwesomeAlertTheme().internalBodyPadding ?? paddingBody),
                  child: BodyDefaultAlert(
                    close: closeButton == true ? () => hideAlert() : null,
                    title: title,
                    description: description,
                    heightButtons: heightButtons,
                    buttonCornerRadius: buttonCornerRadius,
                    cornerRadius: cornerRadius ?? AwesomeAlertTheme().borderRadius,
                    confirmText: confirmText,
                    confirmAction: () => confirmAction(),
                    confirmButtonTextStyle: confirmButtonTextStyle,
                    confirmButtonColor: confirmButtonColor,
                    cancelButtonColor: cancelButtonColor,
                    cancelButtonTextStyle: cancelButtonTextStyle,
                    textAlignDescription: textAlignDescription,
                    cancelAction: cancelAction != null ? () => cancelAction() : null,
                    cancelText: cancelText,
                    descriptionStyle: descriptionStyle,
                    titleStyle: titleStyle,
                    body: body,
                    isHtml: isHtml ?? false,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      isOpened = false;
      if (onComplete != null) onComplete();
    });
  }

  /// **LEGACY API** - Use [AwesomeAlert.showCustom] instead.
  ///
  /// Shows a custom alert. This method requires an instance of [AwesomeAlert].
  @Deprecated('Use AwesomeAlert.showCustom() instead.')
  void showCustomAlert({
    required Widget? body,
    Function? onComplete,
    bool cancelable = false,
    double? cornerRadius,
    double paddingScreen = 15,
    double? fixedSize,
  }) {
    hideAlert();
    isOpened = true;

    showDialog(
      barrierDismissible: cancelable,
      context: _context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: cancelable,
          child: Dialog(
            insetPadding: EdgeInsets.all(AwesomeAlertTheme().defaultPaddingAlert ?? paddingScreen),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
            ),
            child: ConstrainedBox(
              constraints: (fixedSize != null || AwesomeAlertTheme().fixedSize != null)
                  ? BoxConstraints(maxWidth: fixedSize ?? AwesomeAlertTheme().fixedSize ?? 700)
                  : BoxConstraints(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
                ),
                child: body,
              ),
            ),
          ),
        );
      },
    ).whenComplete(() {
      isOpened = false;
      if (onComplete != null) onComplete();
    });
  }

  /// **LEGACY API** - Use [AwesomeAlert.showLoading] instead.
  ///
  /// Shows a loading alert. This method requires an instance of [AwesomeAlert].
  @Deprecated('Use AwesomeAlert.showLoading() instead.')
  void alertLoading({
    Color? backgroundColor,
    Color? progressColor,
    double borderRadius = 100,
    double paddingFromProgress = 10,
    double sizeProgress = 35,
    double strokeWidth = 5,
    Function? onComplete,
    bool cancelable = false,
  }) {
    hideAlert();
    isOpened = true;
    showDialog(
        barrierDismissible: cancelable,
        context: _context,
        builder: (BuildContext context) {
          //will pop to prevent user to close
          return PopScope(
            canPop: cancelable,
            onPopInvokedWithResult: (didPop, result) {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: backgroundColor ?? Colors.white,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(paddingFromProgress),
                    child: SizedBox(
                      width: sizeProgress,
                      height: sizeProgress,
                      child: CircularProgressIndicator(
                        strokeWidth: strokeWidth,
                        color: progressColor ?? AwesomeAlertTheme().progressColor ?? Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }).whenComplete(() {
      isOpened = false;
      if (onComplete != null) onComplete();
    });
  }

  /// **LEGACY API** - Use [AwesomeAlert.showImage] instead.
  ///
  /// Shows an image alert. This method requires an instance of [AwesomeAlert].
  @Deprecated('Use AwesomeAlert.showImage() instead.')
  void alertImage({
    required String path,
    required int type,
    bool? cancelable = true,
    Function? onClose,
    double? width,
    double? borderRadius,
    double paddingFromPhoneBorder = 10,
    double closeIconSize = 25,
    BoxFit? fit = BoxFit.contain,
    double? fixedSize,
  }) {
    showCustomAlert(
      body: BodyAlertImage(
        type: type,
        onClose: onClose != null ? () => onClose() : () => hideAlert(),
        borderRadius: borderRadius ?? AwesomeAlertTheme().borderRadius,
        path: path,
        width: width,
        closeIconSize: closeIconSize,
        fit: fit,
      ),
      cancelable: cancelable ?? true,
      paddingScreen: paddingFromPhoneBorder,
      cornerRadius: borderRadius ?? AwesomeAlertTheme().borderRadius,
      fixedSize: fixedSize, // Passando o fixedSize para showCustomAlert
    );
  }

  /// **LEGACY API** - Use [AwesomeAlert.showList] instead.
  ///
  /// Shows a list alert. This method requires an instance of [AwesomeAlert].
  @Deprecated('Use AwesomeAlert.showList() instead.')
  void alertList(
    String title,
    List<String> items, {
    String? msg,
    double? cornerRadius,
    double? paddingBody = 15,
    double? paddingScreen = 15,
    double? buttonCornerRadius = 100,
    double? heightButtons = 40,
    double? verticalListSpace = 5,
    String? titleButton,
    Function? buttonClick,
    double? fixedSize,
  }) {
    try {
      hideAlert();
      isOpened = true;
      showDialog(
        context: _context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.all(AwesomeAlertTheme().defaultPaddingAlert ?? paddingScreen ?? 15),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
            ),
            child: ConstrainedBox(
              constraints: (fixedSize != null || AwesomeAlertTheme().fixedSize != null)
                  ? BoxConstraints(maxWidth: fixedSize ?? AwesomeAlertTheme().fixedSize ?? 700)
                  : BoxConstraints(),
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(paddingBody ?? 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 22,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        msg != null ? Text(msg) : const SizedBox(),
                        SizedBox(height: msg == null ? 0 : 10),
                        items.isNotEmpty
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true, // Permite que a lista se ajuste ao conteúdo
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: verticalListSpace ?? 5),
                                    child: Text("* ${items[index]}"),
                                  );
                                },
                              )
                            : const SizedBox(),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                onPressed: () {
                                  if (buttonClick != null) {
                                    buttonClick();
                                  } else {
                                    Navigator.pop(context);
                                  }
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AwesomeAlertTheme().buttonRadius ?? buttonCornerRadius ?? 100),
                                ),
                                height: AwesomeAlertTheme().buttonHeight ?? heightButtons,
                                color: Theme.of(context).colorScheme.primary,
                                child: Text(
                                  titleButton ?? "Voltar",
                                  style: AwesomeAlertTheme().confirmButtonTextStyle ??
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
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).whenComplete(() {
        isOpened = false;
      });
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  // --- NEW STATIC API ---

  /// Modern static method to show a standard alert.
  ///
  /// [context] remains required to show the dialog.
  /// [title] is the bold text at the top.
  /// [description] is the main content.
  /// [confirmText] is the text for the positive action button.
  /// [confirmAction] is the callback when [confirmText] button is pressed.
  ///
  /// Optional parameters allow for deep customization like styles, colors, and behavior.
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String description,
    required String confirmText,
    required VoidCallback confirmAction,
    VoidCallback? onDismiss,
    VoidCallback? cancelAction,
    String? cancelText,
    Color? confirmButtonColor,
    Color? cancelButtonColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextStyle? confirmButtonTextStyle,
    TextStyle? cancelButtonTextStyle,
    TextAlign? textAlignDescription,
    Widget? body,
    bool cancelable = false,
    double? cornerRadius,
    double contentPadding = 15,
    double insetPadding = 15,
    double buttonRadius = 100,
    double buttonHeight = 40,
    bool isHtml = false,
    bool showCloseButton = false,
    double? fixedSize,
  }) {
    return showDialog<T>(
      barrierDismissible: cancelable,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: cancelable,
          child: Dialog(
            insetPadding: EdgeInsets.all(AwesomeAlertTheme().defaultPaddingAlert ?? insetPadding),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
            ),
            child: ConstrainedBox(
              constraints: (fixedSize != null || AwesomeAlertTheme().fixedSize != null)
                  ? BoxConstraints(maxWidth: fixedSize ?? AwesomeAlertTheme().fixedSize ?? 700)
                  : const BoxConstraints(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(AwesomeAlertTheme().internalBodyPadding ?? contentPadding),
                  child: BodyDefaultAlert(
                    close: showCloseButton == true ? () => Navigator.of(context).pop() : null,
                    title: title,
                    description: description,
                    heightButtons: buttonHeight,
                    buttonCornerRadius: buttonRadius,
                    cornerRadius: cornerRadius ?? AwesomeAlertTheme().borderRadius,
                    confirmText: confirmText,
                    confirmAction: confirmAction,
                    confirmButtonTextStyle: confirmButtonTextStyle,
                    confirmButtonColor: confirmButtonColor,
                    cancelButtonColor: cancelButtonColor,
                    cancelButtonTextStyle: cancelButtonTextStyle,
                    textAlignDescription: textAlignDescription,
                    cancelAction: cancelAction,
                    cancelText: cancelText,
                    descriptionStyle: descriptionStyle,
                    titleStyle: titleStyle,
                    body: body,
                    isHtml: isHtml,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss();
      return value;
    });
  }

  /// Modern static method to show a loading alert with a [CircularProgressIndicator].
  ///
  /// [sizeProgress] controls the dimension of the spinner.
  /// [progressColor] defaults to [AwesomeAlertTheme.progressColor] or secondary theme color.
  static Future<T?> showLoading<T>(
    BuildContext context, {
    Color? backgroundColor,
    Color? progressColor,
    double borderRadius = 100,
    double paddingFromProgress = 10,
    double sizeProgress = 35,
    double strokeWidth = 5,
    bool cancelable = false,
    VoidCallback? onDismiss,
  }) {
    return showDialog<T>(
      barrierDismissible: cancelable,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: cancelable,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? Colors.white,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: Padding(
                padding: EdgeInsets.all(paddingFromProgress),
                child: SizedBox(
                  width: sizeProgress,
                  height: sizeProgress,
                  child: CircularProgressIndicator(
                    strokeWidth: strokeWidth,
                    color: progressColor ?? AwesomeAlertTheme().progressColor ?? Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss();
      return value;
    });
  }

  /// Modern static method to show an image alert.
  ///
  /// [path] should be the image source (URL, asset path, or local path).
  /// [type] defines the source type using [ImageType] constants.
  static Future<T?> showImage<T>(
    BuildContext context, {
    required String path,
    required int type,
    bool cancelable = true,
    VoidCallback? onDismiss,
    double? width,
    double? borderRadius,
    double insetPadding = 10,
    double closeIconSize = 25,
    BoxFit fit = BoxFit.contain,
    double? fixedSize,
  }) {
    return showCustom<T>(
      context,
      cancelable: cancelable,
      insetPadding: insetPadding,
      cornerRadius: borderRadius ?? AwesomeAlertTheme().borderRadius,
      fixedSize: fixedSize,
      body: BodyAlertImage(
        type: type,
        onClose: onDismiss ?? () => Navigator.of(context).pop(),
        borderRadius: borderRadius ?? AwesomeAlertTheme().borderRadius,
        path: path,
        width: width,
        closeIconSize: closeIconSize,
        fit: fit,
      ),
    );
  }

  /// Modern static method to show an alert with a list of Bulleted items.
  ///
  /// [items] is the list of strings to be displayed.
  /// [msg] is an optional subtitle text below the title.
  static Future<T?> showList<T>(
    BuildContext context, {
    required String title,
    required List<String> items,
    String? msg,
    double? cornerRadius,
    double contentPadding = 15,
    double insetPadding = 15,
    double buttonRadius = 100,
    double buttonHeight = 40,
    double verticalListSpace = 5,
    String? titleButton,
    VoidCallback? buttonClick,
    double? fixedSize,
  }) {
    return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(AwesomeAlertTheme().defaultPaddingAlert ?? insetPadding),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
          ),
          child: ConstrainedBox(
            constraints: (fixedSize != null || AwesomeAlertTheme().fixedSize != null)
                ? BoxConstraints(maxWidth: fixedSize ?? AwesomeAlertTheme().fixedSize ?? 700)
                : const BoxConstraints(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(contentPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                          fontSize: 22,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (msg != null) Text(msg),
                    SizedBox(height: msg == null ? 0 : 10),
                    if (items.isNotEmpty)
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: verticalListSpace),
                            child: Text("* ${items[index]}"),
                          );
                        },
                      ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: buttonClick ?? () => Navigator.pop(context),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AwesomeAlertTheme().buttonRadius ?? buttonRadius),
                        ),
                        height: AwesomeAlertTheme().buttonHeight ?? buttonHeight,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          titleButton ?? "Voltar",
                          style: AwesomeAlertTheme().confirmButtonTextStyle ??
                              const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  /// Modern static method to show an alert with a completely custom body.
  ///
  /// [body] is the widget to be displayed inside the dialog skeleton.
  /// [backgroundColor] allows setting a custom color for the dialog box.
  static Future<T?> showCustom<T>(
    BuildContext context, {
    required Widget body,
    bool cancelable = false,
    double? cornerRadius,
    double insetPadding = 15,
    double? fixedSize,
    VoidCallback? onDismiss,
    Color? backgroundColor,
  }) {
    return showDialog<T>(
      barrierDismissible: cancelable,
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: cancelable,
          child: Dialog(
            insetPadding: EdgeInsets.all(AwesomeAlertTheme().defaultPaddingAlert ?? insetPadding),
            backgroundColor: backgroundColor ?? Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius ?? AwesomeAlertTheme().borderRadius)),
            ),
            child: ConstrainedBox(
              constraints: (fixedSize != null || AwesomeAlertTheme().fixedSize != null)
                  ? BoxConstraints(maxWidth: fixedSize ?? AwesomeAlertTheme().fixedSize ?? 700)
                  : const BoxConstraints(),
              child: body,
            ),
          ),
        );
      },
    ).then((value) {
      if (onDismiss != null) onDismiss();
      return value;
    });
  }
}



