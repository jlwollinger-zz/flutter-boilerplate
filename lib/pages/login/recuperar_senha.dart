import 'package:flutter/material.dart';
import 'package:login_boilerplate/constants/app_theme.dart';
import 'package:login_boilerplate/services/login_service.dart';
import 'package:login_boilerplate/services/service_locator.dart';
import 'package:login_boilerplate/utils/api_call.dart';
import 'package:login_boilerplate/utils/snackbar_utils.dart';
import 'package:login_boilerplate/utils/validators.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RecuperarSenhaPage extends StatefulWidget {
  @override
  _RecuperarSenhaPageState createState() => _RecuperarSenhaPageState();
}

class _RecuperarSenhaPageState extends State<RecuperarSenhaPage> {
  String email;
  final _formKey = GlobalKey<FormState>();
  LoginService _loginService = locator<LoginService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recover password"),
      ),
      body: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const Text( 
                        'Place your registered e-mail to receive a link for recover your password',
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        validator: Validators.validateEmail,
                        onChanged: (text) => email = text,
                        decoration: InputDecoration(labelText: 'E-mail'),
                      ),
                      SizedBox(height: 20),
                      ButtonTheme(
                          minWidth: double.infinity,
                          height: 40,
                          child: Builder(
                            builder: (context) => RaisedButton(
                              child: Text('Send'),
                              color: ThemeColors.secondary,
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  recoverPassword(context);
                                }
                              },
                            ),
                          )),
                    ],
                  ),
                )),
              ],
            ),
          )),
    );
  }

  void recoverPassword(context) async {
    final progressDialog = new ProgressDialog(context, isDismissible: false);
    progressDialog.style(message: 'Recovering password...');
    await progressDialog.show();

    var apiCall = new ApiCall(context,
        call: () => _loginService.recoverPassword(this.email));
    apiCall.onSuccess = (_) {
      SnackbarUtils.showSuccess(
          context, 'E-mail sent with sucess to the ${this.email} addres');
    };
    apiCall.onFinish = progressDialog.hide;
    apiCall.execute();
  }
}
