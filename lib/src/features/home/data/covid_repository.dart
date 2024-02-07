import 'package:covid_19_app/src/common/http_service.dart';
import 'package:covid_19_app/src/features/home/domain/entities/covid_info.dart';
import 'package:covid_19_app/src/models/http_service_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CovidRepository {
  Future<List<CovidInfo>> getData();
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
}

final covidRepositoryProvider = Provider<CovidRepository>(
  (ref) => CovidRepositoryImpl(),
);
