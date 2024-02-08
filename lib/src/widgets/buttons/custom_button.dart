import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: dimens.borderRadiusContainer(25),
      onTap: () => onTap(),
      child: Ink(
        height: 50,
        width: dimens.fullWidth(context),
        decoration: BoxDecoration(
            borderRadius: dimens.borderRadiusContainer(25),
            color: customColors.orange),
        child: Center(
          child: CustomText(
            label,
            textColor: customColors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
