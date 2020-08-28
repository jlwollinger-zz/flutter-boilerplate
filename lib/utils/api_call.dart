import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:login_boilerplate/utils/snackbar_utils.dart';

// Helper para tratar retornos de requisições para a UI.
class ApiCall<T> {
  final Future<T> Function() call;
  final BuildContext context;
  Function(T) onSuccess;
  //Exceções de regras de negócio no back-end, validações de entidade e etc.
  Function(DioError) onException;
  Function() onFinish;

  ApiCall(this.context,
      {@required this.call, this.onSuccess, this.onException, this.onFinish});

  void execute() async {
    try {
      T response = await call();
      onSuccess(response);
    } on DioError catch (dioError) {
      print('API Error: ' + dioError.toString());
      if (dioError.response?.statusCode == 400) {
        _handleBusinessExceptions(dioError);
      } else {
        if (this.onException != null) {
          this.onException(dioError);
        } else {
          var errorMsg = _getMessageFromError(dioError);
          SnackbarUtils.showError(context, errorMsg);
        }
      }
    } finally {
      this.onFinish();
    }
  }

  // Trata as exceções de negócio padrões
  void _handleBusinessExceptions(DioError dioError) {
    var errorData = dioError.response.data;
    String displayMessage; //Mensagem que será exibida no app

    String errorMsg = errorData['message'];
    List validations = errorData['validations'];

    if (errorMsg != null) {
      displayMessage = errorMsg;
    } else if (validations != null) {
      displayMessage = validations.reduce((a, b) => '$a\n$b');
    }

    SnackbarUtils.showInfo(
        context,
        displayMessage ??
            'An error occured during the execution, please try again');
  }

  String _getMessageFromError(DioError error) {
    if (error.type == DioErrorType.CONNECT_TIMEOUT) {
      return 'Server not responding in time, please try again';
    } else if (error.error is SocketException) {
      return 'Internet connection failed, verify your connection';
    }

    return 'An error occured in the server, try again';
  }
}
