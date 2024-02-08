import 'package:covid_19_app/src/tools/extensions/string_extension.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class StatisticInfo extends StatelessWidget {
  final Color color;
  final String label;
  final String quantity;

  const StatisticInfo({
    super.key,
    required this.color,
    required this.label,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        const SizedBox(width: 10),
        CustomText('$label: ${quantity.toCurrency()}')
      ],
    );
  }
}
