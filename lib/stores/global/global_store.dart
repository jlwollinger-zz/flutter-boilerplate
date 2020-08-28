
import 'package:login_boilerplate/models/user.dart';
import 'package:login_boilerplate/services/profile_service.dart';
import 'package:login_boilerplate/services/service_locator.dart';
import 'package:mobx/mobx.dart';
part 'global_store.g.dart';

// Store com informações que podem ser acessadas à partir de qualquer lugar do aplicativo
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  ProfileService _perfilService = locator<ProfileService>();

  @observable
  String usuarioNome;

  @observable
  String urlFoto;

  void init() async {
    final user = await fetchUserData();
  }

  @action
  Future<User> fetchUserData() async {
    User user = await _perfilService.loadUserFromDisk();
    return user;
  }
}
