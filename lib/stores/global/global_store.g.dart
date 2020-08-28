// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GlobalStore on _GlobalStoreBase, Store {
  final _$usuarioNomeAtom = Atom(name: '_GlobalStoreBase.usuarioNome');

  @override
  String get usuarioNome {
    _$usuarioNomeAtom.reportRead();
    return super.usuarioNome;
  }

  @override
  set usuarioNome(String value) {
    _$usuarioNomeAtom.reportWrite(value, super.usuarioNome, () {
      super.usuarioNome = value;
    });
  }

  final _$urlFotoAtom = Atom(name: '_GlobalStoreBase.urlFoto');

  @override
  String get urlFoto {
    _$urlFotoAtom.reportRead();
    return super.urlFoto;
  }

  @override
  set urlFoto(String value) {
    _$urlFotoAtom.reportWrite(value, super.urlFoto, () {
      super.urlFoto = value;
    });
  }

  final _$fetchUserDataAsyncAction =
      AsyncAction('_GlobalStoreBase.fetchUserData');

  @override
  Future<User> fetchUserData() {
    return _$fetchUserDataAsyncAction.run(() => super.fetchUserData());
  }

  @override
  String toString() {
    return '''
usuarioNome: ${usuarioNome},
urlFoto: ${urlFoto}
    ''';
  }
}
