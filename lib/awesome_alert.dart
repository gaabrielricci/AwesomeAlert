library awesome_alert;

import 'package:awesome_alert/awesome_theme.dart';
import 'package:awesome_alert/widgets/default_alert_body.dart';
import 'package:awesome_alert/widgets/image_alert_body.dart';
import 'package:flutter/material.dart';

class AwesomeAlert {
  //constructor
  AwesomeAlert({required BuildContext context}) {
    _context = context;
  }

  //property Buildcontext. responsible for assigning context and allowing the alert to be inflated
  late BuildContext _context;

  //property that's controll the status of alert
  bool isOpened = false;

  //method to hide opened alert
  hideAlert() {
    if (isOpened) {
      isOpened = false;
      Navigator.canPop(_context) ? Navigator.pop(_context) : null;
    }
  }

  //method that triggers the standard alert with title and text and other customization parameters
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
                    close: closeButton == true ? hideAlert() : null,
                    title: title,
                    description: description,
                    heightButtons: heightButtons,
                    buttonCornerRadius: buttonCornerRadius,
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
    ).whenComplete(() {
      isOpened = false;
      if (onComplete != null) onComplete();
    });
  }

  //method that displays a customized alert, where the body of the alert must be passed, and the customization properties of the alert skeleton.
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

  //Method to open an alert with CircleProgressIndicator
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

  //show alert to load an internet or asset image
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
        onClose: onClose ?? hideAlert,
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

  /// Method to show an alert with a list of items.
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
}
