import 'package:covid_19_app/src/common/http_service.dart';
import 'package:covid_19_app/src/features/home/domain/entities/covid_info.dart';
import 'package:covid_19_app/src/features/home/domain/entities/states.dart';
import 'package:covid_19_app/src/features/home/domain/entities/states_current.dart';
import 'package:covid_19_app/src/models/http_service_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CovidRepository {
  Future<List<CovidInfo>> getData();
  Future<List<States>> getStates();
  Future<List<StatesCurrent>> getCurrentStates();
}

class CovidRepositoryImpl implements CovidRepository {
  @override
  Future<List<CovidInfo>> getData() async {
    try {
      HttpServiceResponse response =
          await httpService.get(endpoint: 'us/current.json');

      return covidInfoFromJson(response.body!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<StatesCurrent>> getCurrentStates() async {
    try {
      HttpServiceResponse response =
          await httpService.get(endpoint: 'states/current.json');

      return statesCurrentFromJson(response.body!);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<States>> getStates() async {
    try {
      HttpServiceResponse response =
          await httpService.get(endpoint: 'states/info.json');

      return statesFromJson(response.body!);
    } catch (e) {
      rethrow;
    }
  }
}

final covidRepositoryProvider = Provider<CovidRepository>(
  (ref) => CovidRepositoryImpl(),
);
