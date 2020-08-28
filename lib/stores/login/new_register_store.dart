import 'package:login_boilerplate/models/register/create_user.dart';
import 'package:login_boilerplate/services/login_service.dart';
import 'package:login_boilerplate/services/service_locator.dart';
import 'package:login_boilerplate/utils/validators.dart';
import 'package:mobx/mobx.dart';
part 'new_register_store.g.dart';

class NewRegisterStore = _NewRegisterStoreBase with _$NewRegisterStore;

abstract class _NewRegisterStoreBase with Store {
  LoginService _loginService = locator<LoginService>();

  @observable
  bool hidePassword = true;

  @observable
  String email;

  @observable
  String password;

  @observable
  String name;

  @observable
  DateTime birthday;

  Future register() {
    final user = CreateUser(
        username: this.email,
        password: this.password,
        nome: this.name,
        birthday: this.birthday);
    return _loginService.register(user);
  }

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setName(String name) => this.name = name;

  @action
  void setPassword(String password) => this.password = password;

  @action
  void setBirthday(DateTime birthday) =>
      this.birthday = birthday;

  @action
  void swapPasswordVisibility() => this.hidePassword = !this.hidePassword;

  bool isPasswordValid() {
    if(this.password == null || this.password.isEmpty) {
      return true;
    }
    return Validators.isPasswordValid(this.password);
  }
}
