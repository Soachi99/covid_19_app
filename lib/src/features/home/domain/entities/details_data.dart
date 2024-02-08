import 'package:covid_19_app/src/features/home/domain/entities/states.dart';
import 'package:covid_19_app/src/features/home/domain/entities/states_current.dart';

class DetailsData {
  final States state;
  final StatesCurrent stateCurrent;

  DetailsData({required this.state, required this.stateCurrent});
}
