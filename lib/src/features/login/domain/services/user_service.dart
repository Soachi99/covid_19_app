import 'package:covid_19_app/src/features/login/data/login_repository.dart';
import 'package:covid_19_app/src/features/login/domain/entities/users.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserService {
  Future<(int, String)> verifyUser(String username, String password);
}

class UserServiceImpl implements UserService {
  final LoginRepository loginRepository;

  UserServiceImpl({required this.loginRepository});

  @override
  Future<(int, String)> verifyUser(String username, String password) async {
    List<Users> users = await loginRepository.getUsers();

    Users? user =
        users.where((element) => element.userName == username).firstOrNull;

    if (user == null) {
      users.add(Users(userName: username, password: password));
      loginRepository.addUser(users);
      return (
        1,
        'Usuario no exite, pero fue registrado a nuestra base de datos, por favor intente de nuevo.'
      );
    }

    if (user.password != password) {
      return (2, 'Contraseña incorrecta.');
    }

    return (0, 'Usuario correcto.');
  }
}

final userServiceProvider = Provider<UserService>(
  (ref) => UserServiceImpl(loginRepository: ref.watch(loginRepositoryProvider)),
);
