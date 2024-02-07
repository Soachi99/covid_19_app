import 'package:covid_19_app/src/features/home/data/covid_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'details_state.dart';

class DetailsController extends StateNotifier<DetailsState> {
  final CovidRepository covidRepository;
  DetailsController(this.covidRepository) : super(DetailsState());

  onInit() async {
    state = state.copyWith(
        states: await covidRepository.getStates(),
        statesCurrent: await covidRepository.getCurrentStates());
  }
}

final detailsController =
    StateNotifierProvider<DetailsController, DetailsState>((ref) {
  return DetailsController(ref.watch(covidRepositoryProvider));
});
