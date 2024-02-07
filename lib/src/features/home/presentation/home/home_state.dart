// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:covid_19_app/src/features/home/domain/entities/covid_info.dart';
import 'package:covid_19_app/src/features/home/domain/entities/info_device.dart';

class HomeState {
  bool? isDarkTheme;
  InfoDevice? deviceInfo;
  CovidInfo? covidInfo;

  HomeState({this.isDarkTheme, this.deviceInfo, this.covidInfo});

  HomeState copyWith(
      {InfoDevice? deviceInfo, bool? isDarkTheme, CovidInfo? covidInfo}) {
    return HomeState(
        deviceInfo: deviceInfo ?? this.deviceInfo,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
        covidInfo: covidInfo ?? this.covidInfo);
  }
}
