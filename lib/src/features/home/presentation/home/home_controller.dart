import 'package:covid_19_app/src/features/home/data/covid_repository.dart';
import 'package:covid_19_app/src/features/home/data/device_repository.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final DeviceRepository homeRepository;
  final CovidRepository covidRepository;
  HomeController(this.homeRepository, this.covidRepository)
      : super(HomeState());

  onInit() async {
    state = state.copyWith(
        deviceInfo: await homeRepository.getInfoByPlatform(),
        covidInfo: (await covidRepository.getData()).first);
  }

  toggleTheme(bool value) {
    customColors.actualiceOnThemeChange(!value);
    state = state.copyWith(isDarkTheme: value);
  }
}

final homeController = StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController(
      ref.watch(deviceRepositoryProvider), ref.watch(covidRepositoryProvider));
});
