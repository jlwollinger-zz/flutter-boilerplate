// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$emailAtom = Atom(name: '_LoginStoreBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStoreBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$hidePasswordAtom = Atom(name: '_LoginStoreBase.hidePassword');

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void swapPasswordVisibility() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.swapPasswordVisibility');
    try {
      return super.swapPasswordVisibility();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
hidePassword: ${hidePassword}
    ''';
  }
}
