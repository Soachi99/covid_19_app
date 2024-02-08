import 'package:covid_19_app/src/features/home/domain/entities/details_data.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/widgets/statistic_info.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter/material.dart';

class AllStatistics extends StatelessWidget {
  const AllStatistics({
    super.key,
    required this.data,
  });

  final DetailsData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Column(
        children: [
          StatisticInfo(
            color: customColors.blue,
            label: 'Casos positivos',
            quantity: data.stateCurrent.positive.toString(),
          ),
          const SizedBox(
            height: 4,
          ),
          StatisticInfo(
            color: customColors.red,
            label: 'Casos negativos',
            quantity: (data.stateCurrent.negative ?? 0).toString(),
          ),
          const SizedBox(
            height: 4,
          ),
          StatisticInfo(
            color: customColors.grey,
            label: 'Muertes',
            quantity: data.stateCurrent.death.toString(),
          ),
          const SizedBox(
            height: 4,
          ),
          StatisticInfo(
            color: customColors.orange,
            label: 'Pacientes recuperados',
            quantity: (data.stateCurrent.recovered ?? 0).toString(),
          ),
        ],
      ),
    );
  }
}
