import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:login_boilerplate/constants/app_theme.dart';
import 'package:login_boilerplate/stores/login/new_register_store.dart';
import 'package:login_boilerplate/utils/api_call.dart';
import 'package:login_boilerplate/utils/snackbar_utils.dart';
import 'package:login_boilerplate/utils/validators.dart';
import 'package:progress_dialog/progress_dialog.dart';

class NovoCadastroForm extends StatefulWidget {
  @override
  _NovoCadastroFormState createState() => _NovoCadastroFormState();
}

class _NovoCadastroFormState extends State<NovoCadastroForm> {
  final _newRegsiterStore = NewRegisterStore();
  final _formKey = GlobalKey<FormState>();
  final _txBirthday = TextEditingController();
  final userDataRequired = Platform.isAndroid;
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _snack;

 
  List<Widget> _formFields(BuildContext context) {
    return <Widget>[
      TextFormField(
        validator: Validators.validateEmail,
        onChanged: _newRegsiterStore.setEmail,
        decoration: InputDecoration(labelText: 'E-mail'),
      ),
      TextFormField(
        validator: Validators.validateRequired,
        onChanged: _newRegsiterStore.setName,
        decoration: InputDecoration(labelText: 'Name'),
      ),
      Observer(
        builder: (_) {
          return TextFormField(
            validator: Validators.validatePassword,
            onChanged: _newRegsiterStore.setPassword,
            obscureText: _newRegsiterStore.hidePassword,
            decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(_newRegsiterStore.hidePassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed:
                  this._newRegsiterStore.swapPasswordVisibility,
                )),
          );
        },
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              onTap: () => _selectDate(context),
              controller: _txBirthday,
              readOnly: true,
              decoration: InputDecoration(
                  labelText: 'Birthday',
                  hintText: "dd/mm/aaaa",
                  alignLabelWithHint: true,
                  labelStyle: TextStyle(fontSize: 13)),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print('build cadastro');
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Scrollbar (
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: _formFields(context),
                  ),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 40,
              child: new RaisedButton(
                child: Text('Register'),
                color: ThemeColors.secondary,
                onPressed: () => _enviarCadastro(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _validate() {

    if(_snack != null) {
      _snack.close();
      _snack = null;
    }

    if (!_formKey.currentState.validate()) {
      if (!_newRegsiterStore.isPasswordValid()) {
        _snack = SnackbarUtils.showError(context, 'The password must contain: \nAt least 6 characters, 1 letters and 1 number');
      }
      return false;
    }

    if(!Platform.isIOS) {
      if(_newRegsiterStore.birthday == null) {
        _snack = SnackbarUtils.showError(context, 'Enter your born date.');
        return false;
      }
    }
    return true;
  }

  _enviarCadastro(BuildContext context) async {
    if(!_validate()) {
      return;
    }

    // Solicitação de cadastro
    ProgressDialog pr = new ProgressDialog(context, isDismissible: false);
    pr.style(message: 'Registering...');
    await pr.show();

    final apiCall = new ApiCall(context, call: _newRegsiterStore.register);
    apiCall.onSuccess = (response) {
      print(response);
      SnackbarUtils.showInfo(
          context, 'Check your e-mail to finish your registry');
      DefaultTabController.of(context).index = 0;
      _formKey.currentState.reset();
    };
    apiCall.onFinish = pr.hide;
    apiCall.execute();
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime(1990),
        initialDatePickerMode: DatePickerMode.year,
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    if (picked != null) {
      _newRegsiterStore.setBirthday(picked);
      _txBirthday.text = new DateFormat('dd/MM/yyyy').format(picked);
    }
  }
}
