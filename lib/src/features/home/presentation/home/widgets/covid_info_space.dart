import 'package:covid_19_app/src/features/home/presentation/home/home_state.dart';
import 'package:covid_19_app/src/features/home/presentation/home/widgets/info_covid_container.dart';
import 'package:covid_19_app/src/tools/extensions/string_extension.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CovidInfoSpace extends StatelessWidget {
  const CovidInfoSpace({
    super.key,
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: dimens.fullWidth(context),
        height: dimens.fullHeight(context) * .55,
        padding: EdgeInsets.only(top: dimens.fullHeight(context) * .1),
        decoration: BoxDecoration(
          color: customColors.grey,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CustomText(
                  'Fecha recolección datos: ${state.covidInfo?.date.toString().formatDate()}',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.topCenter,
              child: Wrap(
                runSpacing: 16,
                spacing: 24,
                children: [
                  InfoCovidContainer(
                    title: 'Casos totales',
                    quantity: state.covidInfo?.totalTestResults ?? 0,
                  ),
                  InfoCovidContainer(
                    title: 'Casos confirmados',
                    quantity: state.covidInfo?.totalTestResultsIncrease ?? 0,
                  ),
                  InfoCovidContainer(
                    title: 'Pruebas negativas',
                    quantity: state.covidInfo?.negative ?? 0,
                  ),
                  InfoCovidContainer(
                    title: 'Pruebas positivas',
                    quantity: state.covidInfo?.positive ?? 0,
                  ),
                  InfoCovidContainer(
                    title: 'Fallecidos',
                    quantity: state.covidInfo?.death ?? 0,
                  ),
                  InfoCovidContainer(
                    title: 'Recuperados',
                    quantity: state.covidInfo?.recovered ?? 0,
                  ),
                  InfoCovidContainer(
                    title: 'Pruebas pendientes',
                    quantity: state.covidInfo?.pending ?? 0,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(20),
              child: CustomText(
                '“El proyecto COVID Tracking ha finalizado toda recopilación de datos a partir del 7 de marzo de 2021”.',
                fontSize: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
