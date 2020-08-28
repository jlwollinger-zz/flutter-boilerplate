import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_boilerplate/utils/color_utils.dart';

// Classe responsável por exibir os layout's padrões de Snackbar
class SnackbarUtils {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccess(
      BuildContext context, String message,
      {Duration duration = const Duration(seconds: 4)}) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.green[700],
      duration: duration,
    ));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showInfo(
      BuildContext context, String message) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: getColorFromHex('#ffea96'),
    ));
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showError(
      BuildContext context, String message) {
    return Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
      ),
      duration: Duration(seconds: 6),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
