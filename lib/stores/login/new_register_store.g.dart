// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewRegisterStore on _NewRegisterStoreBase, Store {
  final _$hidePasswordAtom = Atom(name: '_NewRegisterStoreBase.hidePassword');

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

  final _$emailAtom = Atom(name: '_NewRegisterStoreBase.email');

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

  final _$passwordAtom = Atom(name: '_NewRegisterStoreBase.password');

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

  final _$nameAtom = Atom(name: '_NewRegisterStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$birthdayAtom = Atom(name: '_NewRegisterStoreBase.birthday');

  @override
  DateTime get birthday {
    _$birthdayAtom.reportRead();
    return super.birthday;
  }

  @override
  set birthday(DateTime value) {
    _$birthdayAtom.reportWrite(value, super.birthday, () {
      super.birthday = value;
    });
  }

  final _$_NewRegisterStoreBaseActionController =
      ActionController(name: '_NewRegisterStoreBase');

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_NewRegisterStoreBaseActionController.startAction(
        name: '_NewRegisterStoreBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_NewRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_NewRegisterStoreBaseActionController.startAction(
        name: '_NewRegisterStoreBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_NewRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String password) {
    final _$actionInfo = _$_NewRegisterStoreBaseActionController.startAction(
        name: '_NewRegisterStoreBase.setPassword');
    try {
      return super.setPassword(password);
    } finally {
      _$_NewRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthday(DateTime birthday) {
    final _$actionInfo = _$_NewRegisterStoreBaseActionController.startAction(
        name: '_NewRegisterStoreBase.setBirthday');
    try {
      return super.setBirthday(birthday);
    } finally {
      _$_NewRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void swapPasswordVisibility() {
    final _$actionInfo = _$_NewRegisterStoreBaseActionController.startAction(
        name: '_NewRegisterStoreBase.swapPasswordVisibility');
    try {
      return super.swapPasswordVisibility();
    } finally {
      _$_NewRegisterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hidePassword: ${hidePassword},
email: ${email},
password: ${password},
name: ${name},
birthday: ${birthday}
    ''';
  }
}
