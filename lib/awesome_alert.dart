library awesome_alert;

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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        style: titleStyle ??
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
                            const TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                            ),
                        textAlign: textAlignMsg ?? TextAlign.center,
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
                                cancelAction();
                              },
                              shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCornerRadius)),
                              height: heightButtons,
                              color: cancelColor ?? Colors.black38,
                              child: Text(cancelText, style: buttonTextStyle ?? const TextStyle(fontSize: 16)),
                            ),
                          )
                              : const SizedBox(),
                          Padding(
                              padding: EdgeInsets.only(left: (cancelText != null && cancelAction != null) ? 10 : 0)),
                          Expanded(
                            child: MaterialButton(
                              onPressed: () {
                                confirmAction();
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonCornerRadius)),
                              height: heightButtons,
                              color: confirmColor ?? Colors.blueAccent,
                              child: Text(confirmText, style: buttonTextStyle ?? const TextStyle(fontSize: 16)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    ).whenComplete(() {
      isOpened = false;
    });
  }

  void showCustomAleert({
    required Widget? body,
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
    });
  }
}
