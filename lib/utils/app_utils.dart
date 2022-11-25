import 'package:flutter/material.dart';

class AppUtils {
  static dismissKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
