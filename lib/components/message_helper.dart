import 'package:flutter/material.dart';

class MessageHelper {
  static GlobalKey<ScaffoldMessengerState> scaffoldMessagerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showMessage(bool isSuccess, String message) {
    scaffoldMessagerKey.currentState!.showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: isSuccess == true ? Colors.green : Colors.red,
        content: Text(
          message,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
