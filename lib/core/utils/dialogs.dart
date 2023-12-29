// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:riverpod_and_mvc_case/main.dart';

class Dialogs {
  static Future bottomSheet(
    Widget widget, {
    bool isDismissible = true,
  }) {
    return showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: isDismissible,
      context: navigationKey.currentContext!,
      builder: (_) {
        return widget;
      },
    );
  }

  static Future<void> showAlert({
    required String title,
    required String content,
    String? cancelText,
    String okeyText = "okey",
    void Function()? okeyPressed,
    void Function()? cancelPressed,
    cancellable = true,
    TextAlign? textAlign,
  }) {
    BuildContext? context = navigationKey.currentContext;
    if (context == null) {
      return Future(() => null);
    }
    return showDialog(
      context: navigationKey.currentContext!,
      barrierDismissible: cancellable,
      builder: (_) {
        return WillPopScope(
          onWillPop: cancellable
              ? null
              : () async {
                  return false;
                },
          child: AlertDialog(
            title: Text(title),
            content: Text(
              content,
              textAlign: textAlign,
            ),
            actionsPadding: EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 15),
            actions: [
              if (cancelText != null)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    if (cancelPressed != null) cancelPressed();
                  },
                  child: Text(
                    cancelText,
                  ),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  if (okeyPressed != null) okeyPressed();
                },
                child: Text(
                  okeyText,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> infoAlert(String content) {
    return showAlert(title: "To Inform", content: content);
  }

  static Future<void> successAlert({String? content}) {
    return showAlert(title: "Success", content: content ?? "Operation Success");
  }

  static Future<void> failAlert({String? content}) {
    return showAlert(title: "Fail", content: content ?? "Operation Failed");
  }

  static Future<void> fillEmptySpacesAlert() {
    return showAlert(title: "To Inform", content: "Fill Empty Spaces");
  }

  static Future<void> twoChoiceDialog(
    String title,
    String content, {
    Function()? cancel,
    Function()? okey,
    String cancelText = "no",
    String okText = "yes",
  }) {
    BuildContext? context = navigationKey.currentContext;
    if (context == null) {
      return Future(() => null);
    }

    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
        ),
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 15,
        ),
        actionsPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        elevation: 6,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  cancel == null ? null : cancel();
                },
                child: Text(cancelText),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, okText);
                  okey == null ? null : okey();
                },
                child: Text(okText),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future<void> customDialog({
    required String title,
    Widget? content,
    List<Widget>? actions,
    bool? scrollable,
  }) {
    BuildContext? context = navigationKey.currentContext;
    if (context == null) {
      return Future(() => null);
    }

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
        title: Center(child: Text(title)),
        content: content,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        actions: actions,
        scrollable: scrollable ?? false,
      ),
    );
  }

  static var loadingDialog = AlertDialog(
    content: Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(child: Text("Please Wait")),
            )
          ],
        ),
      ),
    ),
  );

  static void showLoading() {
    if (navigationKey.currentContext == null) return;
    showDialog(
      context: navigationKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return loadingDialog;
      },
    );
  }

  static void closeDialog() {
    if (navigationKey.currentContext == null) return;
    Navigator.of(navigationKey.currentContext!, rootNavigator: true).pop('dialog');
  }

  static void hideLoading() {
    if (navigationKey.currentContext == null) {
      print("ERROR: navigationKey.currentContext! is NULL");
      return;
    }
    Navigator.of(navigationKey.currentContext!, rootNavigator: true).pop('dialog');
  }

  static void close() {
    if (navigationKey.currentContext == null) {
      print("ERROR: navigationKey.currentContext! is NULL");
      return;
    }
    Navigator.of(navigationKey.currentContext!).pop();
  }

  static void closeWithData(data) {
    if (navigationKey.currentContext == null) {
      print("ERROR: navigationKey.currentContext! is NULL");
      return;
    }
    Navigator.of(navigationKey.currentContext!).pop(data);
  }
}
