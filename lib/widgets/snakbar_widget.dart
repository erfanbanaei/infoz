import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:infoz/constans/color.dart';

void FloatingSnackBar(BuildContext context, String message) {
  return floatingSnackBar(
    context: context,
    message: message,
    textStyle: TextStyle(color: flexSchemeDark.primary),
    duration: const Duration(milliseconds: 4000),
    backgroundColor: flexSchemeDark.onPrimary,
  );
}
