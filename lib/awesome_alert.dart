library awesome_alert;

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
    Color? confirmColor,
    Color? cancelColor,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
    TextStyle? buttonTextStyle,
    Widget? body,
    TextAlign? textAlignMsg,
    bool cancelable = false,
    double cornerRadius = 12,
    double paddingBody = 15,
    double paddingScreen = 15,
    double buttonCornerRadius = 100,
    double heightButtons = 40,
  }) {
    hideAlert();
    isOpened = true;

    showDialog(
      barrierDismissible: cancelable,
      context: _context,
      builder: (BuildContext context) {
        //willpop to prevent the user from closing the alert
        return PopScope(
          canPop: cancelable,
          child: Dialog(
              insetPadding: EdgeInsets.all(paddingScreen),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(cornerRadius),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(cornerRadius),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(paddingBody),
                  //here call body alert and pass the paramters received from user
                  child: BodyDefaultAlert(
                    title: title,
                    description: description,
                    paddingScreen: paddingScreen,
                    heightButtons: heightButtons,
                    buttonCornerRadius: buttonCornerRadius,
                    cornerRadius: cornerRadius,
                    paddingBody: paddingBody,
                    confirmText: confirmText,
                    confirmAction: confirmAction,
                    buttonTextStyle: buttonTextStyle,
                    cancelAction: cancelAction,
                    cancelText: cancelText,
                    cancelColor: cancelColor,
                    confirmColor: confirmColor,
                    descriptionStyle: descriptionStyle,
                    textAlignMsg: textAlignMsg,
                    titleStyle: titleStyle,
                    body: body,
                  ),
                ),
              )),
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
    double cornerRadius = 12,
    double paddingScreen = 15,
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
            insetPadding: EdgeInsets.all(paddingScreen),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(cornerRadius),
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(cornerRadius),
                  ),
                ),
                child: body),
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
    bool cancelable = true,
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
            onPopInvoked: (p0) {},
            //body of alert
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
                        color: progressColor ?? Colors.blue,
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
    required String imageUrl,
    bool? isLocal = false,
    bool? cancelable = true,
    Function? onClose,
    double? width,
    double borderRadius = 10,
    double paddingFromPhoneBorder = 10,
    double closeIconSize = 25,
    BoxFit? fit = BoxFit.contain,
  }) {
    showCustomAlert(
      //here call body alert and pass the paramters received from user to show image
      body: BodyAlertImage(
        isLocal: isLocal ?? false,
        onClose: onClose ?? hideAlert,
        borderRadius: borderRadius,
        imageUrl: imageUrl,
        width: width,
        closeIconSize: closeIconSize,
        fit: fit,
      ),
      cancelable: cancelable ?? true,
      paddingScreen: paddingFromPhoneBorder,
      cornerRadius: borderRadius,
    );
  }
}
