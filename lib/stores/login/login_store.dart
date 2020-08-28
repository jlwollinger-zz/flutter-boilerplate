import 'package:login_boilerplate/models/login/login_payload.dart';
import 'package:login_boilerplate/services/login_service.dart';
import 'package:login_boilerplate/services/service_locator.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  LoginService _loginService = locator<LoginService>();

  @observable
  String email;

  @observable
  String password;

  @observable
  bool hidePassword = true;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  @action
  void swapPasswordVisibility() => this.hidePassword = !this.hidePassword;

  Future login() async {
    return _loginService.authenticate(LoginPayload(email, password));
  }

  String validateEmail(String email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return 'Invalid e-mail';
    }
    return null;
  }

  String validatePassword(String password) {
    bool passwordValid = password != null && password.length > 3;
    if (!passwordValid) {
      return 'Wrong password';
    }
    return null;
  }
}
