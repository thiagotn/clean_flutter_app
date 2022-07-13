import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorMessage(String error) {
  Get.snackbar(
    error,
    error,
    icon: const Icon(Icons.person, color: Colors.white),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red[900],
  );

  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     backgroundColor: Colors.red[900],
  //     content: Text(
  //       error,
  //       textAlign: TextAlign.center,
  //     ),
  //   ),
  // );
}
