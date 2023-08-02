library awesome_alert;

import 'package:awesome_alert/widgets/default_alert_body.dart';
import 'package:flutter/material.dart';

class AwesomeAlert {
  AwesomeAlert({required BuildContext context}) {
    _context = context;
  }

  late BuildContext _context;

  bool isOpened = false;

  hideAlert() {
    if (isOpened) {
      isOpened = false;
      Navigator.pop(_context);
    }
  }

  Future<bool> _onPop(bool cancelable) {
    if (cancelable) {
      return Future(() => true);
    } else {
      return Future(() => false);
    }
  }

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
        return WillPopScope(
          onWillPop: () async {
            return _onPop(cancelable);
          },
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
                  child: DefaultAlertBody(
                    title: title,
                    description: description,
                    paddingScreen: paddingScreen,
                    heightButtons: heightButtons,
                    buttonCornerRadius: buttonCornerRadius,
                    cornerRadius: cornerRadius,
                    paddingBody: paddingBody,
                    confirmText: confirmText,
                    confirmAction: confirmAction,
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

  void showCustomAleert({
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
        return WillPopScope(
          onWillPop: () {
            return _onPop(cancelable);
          },
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
}
