import 'dart:math';

import 'package:covid_19_app/src/tools/extensions/string_extension.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsContainer extends StatelessWidget {
  final String state;
  final int totalCases;
  final String date;

  const DetailsContainer({
    super.key,
    required this.state,
    required this.totalCases,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: customColors.black),
          borderRadius: dimens.borderRadiusContainer(10),
          color: customColors.lightGrey),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent),
                child: ClipOval(
                    child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: AssetImage(images.covid),
                        image: NetworkImage(
                            'https://picsum.photos/seed/${Random().nextInt(999) + 1}/200/300')))),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  state,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  'Casos totales: ${totalCases.toString().toCurrency()}',
                  fontSize: 12,
                  height: 1.2,
                ),
                CustomText(
                  'Ultima modificación: ${date.substring(0, 10)}',
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
    );
  }
}
