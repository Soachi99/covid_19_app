import 'package:covid_19_app/src/tools/extensions/string_extension.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class InfoCovidContainer extends StatelessWidget {
  const InfoCovidContainer({
    super.key,
    required this.title,
    required this.quantity,
  });

  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: customColors.white,
          borderRadius: dimens.borderRadiusContainer(10)),
      width: dimens.fullWidth(context) * .35,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            quantity.toString().toCurrency(),
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            title,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}
