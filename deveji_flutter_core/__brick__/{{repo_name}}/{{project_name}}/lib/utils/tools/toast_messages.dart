import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// Sends a toast notification with the [message] to the user.
void notifyUserUsingToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 4,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    fontSize: 16,
  );
}
