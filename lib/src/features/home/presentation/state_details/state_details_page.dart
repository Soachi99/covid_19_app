import 'package:covid_19_app/src/features/home/domain/entities/details_data.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/state_details_controller.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/widgets/all_statistic.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/widgets/carousel.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class StateDetailsPage extends ConsumerWidget {
  final DetailsData data;

  const StateDetailsPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(stateDetailsControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: customColors.grey,
          title: CustomText(data.state.name)),
      body: SafeArea(
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Carousel(
                    data: data,
                    controller: controller,
                  ),
                  const CustomText(
                    'Estadisticas principales',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  CustomText(
                      'Según los datos recopilados, las estadisticas de ${data.state.name} indican que:'),
                  AllStatistics(data: data),
                  PieChart(data: data),
                  const CustomText(
                    'Notas Adicionales',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                  CustomText(data.state.notes)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PieChart extends StatelessWidget {
  const PieChart({
    super.key,
    required this.data,
  });

  final DetailsData data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: DChartPieO(
          animate: true,
          animationDuration: const Duration(milliseconds: 500),
          data: [
            OrdinalData(
                domain: 'Positive',
                measure: data.stateCurrent.positive,
                color: customColors.blue),
            OrdinalData(
                domain: 'Negative',
                measure: data.stateCurrent.negative ?? 0,
                color: customColors.red),
            OrdinalData(
                domain: 'Death',
                measure: data.stateCurrent.death,
                color: customColors.grey),
            OrdinalData(
                domain: 'Recovered',
                measure: data.stateCurrent.recovered ?? 0,
                color: customColors.orange)
          ],
          customLabel: (ordinalData, index) {
            return '${ordinalData.domain}: ${ordinalData.measure} kg';
          },
        ),
      ),
    );
  }
}
