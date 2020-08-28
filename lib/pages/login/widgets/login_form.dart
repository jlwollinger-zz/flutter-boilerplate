import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_boilerplate/constants/app_theme.dart';
import 'package:login_boilerplate/routes.dart';
import 'package:login_boilerplate/stores/login/login_store.dart';
import 'package:login_boilerplate/utils/api_call.dart';
import 'package:login_boilerplate/utils/validators.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _loginStore = LoginStore();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  login() async {
    final progressDialog = new ProgressDialog(context, isDismissible: false);
    progressDialog.style(message: 'Authenticating...');
    await progressDialog.show();
    var apiCall = new ApiCall(context, call: _loginStore.login);
    apiCall.onSuccess = (_) async {
      await progressDialog.hide();
      Navigator.pushReplacementNamed(context, Routes.home);
    };
    apiCall.onException = (_) async {
      await progressDialog.hide();
      Navigator.pushReplacementNamed(context, Routes.home);
    };
    apiCall.onFinish = progressDialog.hide;
    apiCall.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            validator: Validators.validateEmail,
            onChanged: _loginStore.setEmail,
            decoration: InputDecoration(labelText: 'E-mail'),
          ),
          Observer(
            builder: (_) {
              return TextFormField(
                validator: Validators.validatePassword,
                onChanged: _loginStore.setPassword,
                obscureText: _loginStore.hidePassword,
                decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(_loginStore.hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: this._loginStore.swapPasswordVisibility,
                    )),
              );
            },
          ),
          SizedBox(
            height: 35,
          ),
          ButtonTheme(
            minWidth: double.infinity,
            height: 40,
            child: new RaisedButton(
              child: Text('Login'),
              color: ThemeColors.secondary,
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  login();
                }
              },
            ),
          ),
          FlatButton(
            child: (Text(
              'Forgot my password',
              style: TextStyle(decoration: TextDecoration.underline),
            )),
            onPressed: () => Navigator.pushNamed(context, Routes.esqueciSenha),
          )
        ],
      ),
    );
  }
}
