import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter/material.dart';

class ManImage extends StatelessWidget {
  const ManImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 60,
        top: 0,
        child: SizedBox(
          height: 250,
          child: Image.asset(
            images.man,
            fit: BoxFit.cover,
          ),
        ));
  }
}
