import 'dart:math';

import 'package:covid_19_app/src/features/home/domain/entities/details_data.dart';
import 'package:covid_19_app/src/features/home/domain/entities/states.dart';
import 'package:covid_19_app/src/features/home/domain/entities/states_current.dart';
import 'package:covid_19_app/src/features/home/presentation/state_details/state_details_page.dart';
import 'package:covid_19_app/src/tools/extensions/string_extension.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final States state;
  final StatesCurrent stateCurrent;

  const DetailsContainer({
    super.key,
    required this.stateCurrent,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push<void>(
        MaterialPageRoute(
            builder: (context) => StateDetailsPage(
                DetailsData(state: state, stateCurrent: stateCurrent))),
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: customColors.black),
            borderRadius: dimens.borderRadiusContainer(10),
            color: customColors.lightGrey),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: state.name,
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.transparent),
                    child: ClipOval(
                        child: FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: AssetImage(images.loading),
                            image: NetworkImage(
                                'https://picsum.photos/seed/${Random().nextInt(999) + 1}/200/300')))),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    child: CustomText(
                      state.name,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CustomText(
                    'Casos totales: ${stateCurrent.total.toString().toCurrency()}',
                    fontSize: 12,
                    height: 1.2,
                  ),
                  CustomText(
                    'Ultima modificación: ${stateCurrent.dateModified?.substring(0, 10)}',
                    fontSize: 12,
                    height: 1.2,
                  )
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
