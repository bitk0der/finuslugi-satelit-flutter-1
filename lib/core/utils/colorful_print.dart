import 'package:flutter/material.dart';

extension ColorfulPrint on dynamic {
  void printGreen() {
    debugPrint("\x1B[32m$this\x1B[0m");
  }
}
