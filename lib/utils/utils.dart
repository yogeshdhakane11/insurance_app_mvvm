import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class Utils {
  // Show Toast Message Display
  static void showToast(
    BuildContext context,
    String message, {
    Color backgroundColor = Colors.black,
    Color textColor = Colors.white,
    Duration duration = const Duration(seconds: 2),
  }) {
    // Close any open snackbar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show new snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor, fontSize: 15),
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16), // margin from bottom and side
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  static void error(BuildContext context, String message) =>
      showToast(context, message, backgroundColor: Colors.red.shade700);

  static void warning(BuildContext context, String message) =>
      showToast(context, message, backgroundColor: Colors.orange.shade700);

  // Show FlushBar Message
  static void showFlushBar(BuildContext context, String message) {
    Flushbar(
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.redAccent,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }

  // Show SnackBar Message
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Focus Change Utility (Focus to next field)
  static void changeFocus(BuildContext context, FocusNode currentFocusNode,
      FocusNode nextFocusNode) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocusNode);
  }

  // Custom Dialog Box
  static void showDialogBox(BuildContext context, String title, String message,
      {VoidCallback? onOkPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title:
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                if (onOkPressed != null) {
                  onOkPressed(); // Call optional callback
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  // Error DialogBox
  static void showOtpErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text(
            message,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Ok",
                  style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
