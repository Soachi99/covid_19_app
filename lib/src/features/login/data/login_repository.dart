import 'dart:convert';
import 'dart:io';

import 'package:covid_19_app/src/features/login/domain/entities/users.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

abstract class LoginRepository {
  Future<void> saveDataInLocal();
  Future<List<Users>> getUsers();
  Future<void> addUser(List<Users> users);
}

class LoginRepositoryImpl implements LoginRepository {
  String assetPath = 'assets/data/users.json';

  @override
  Future<void> saveDataInLocal() async {
    if (!await File(await getPathDirectory()).exists()) {
      await copyAssetToFile(assetPath, await getPathDirectory());
    }
  }

  @override
  Future<List<Users>> getUsers() async {
    File file = File(await getPathDirectory());
    String jsonString = await file.readAsString();
    List<Users> response;
    try {
      response = usersFromJson(json.decode(jsonString));
    } catch (e) {
      response = usersFromJson(jsonString);
    }

    return response;
  }

  @override
  Future<void> addUser(List<Users> users) async {
    final File file = File(await getPathDirectory());
    file.writeAsStringSync(json.encode(usersToJson(users)));
  }

  Future<void> copyAssetToFile(String assetPath, String localPath) async {
    File file = File(await getPathDirectory());
    file.writeAsStringSync(json.encode(await rootBundle.loadString(assetPath)));
  }

  Future<String> getPathDirectory() async {
    Directory directory = await getTemporaryDirectory();
    return '${directory.path}/users.json';
  }
}

final loginRepositoryProvider = Provider<LoginRepository>(
  (ref) => LoginRepositoryImpl(),
);
