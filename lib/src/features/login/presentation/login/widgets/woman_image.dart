import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class WomanImage extends StatelessWidget {
  const WomanImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          images.woman,
        ),
        const Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Bienvenido a:',
                    fontSize: 12,
                    textAlign: TextAlign.left,
                  ),
                  CustomText(
                    '   Evertec',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    height: 1.2,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
