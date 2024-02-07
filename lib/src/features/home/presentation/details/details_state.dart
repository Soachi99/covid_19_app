// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:covid_19_app/src/features/home/domain/entities/states.dart';
import 'package:covid_19_app/src/features/home/domain/entities/states_current.dart';

class DetailsState {
  final List<States>? states;
  final List<StatesCurrent>? statesCurrent;

  DetailsState({
    this.states,
    this.statesCurrent,
  });

  DetailsState copyWith({
    List<States>? states,
    List<StatesCurrent>? statesCurrent,
  }) {
    return DetailsState(
      states: states ?? this.states,
      statesCurrent: statesCurrent ?? this.statesCurrent,
    );
  }
}
