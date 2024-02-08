import 'dart:math';

import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter/material.dart';

class PrincipalImage extends StatelessWidget {
  const PrincipalImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: customColors.black,
            spreadRadius: 1,
            blurRadius: 3,
          )
        ]),
        child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage(images.loading),
            image: NetworkImage(
                'https://picsum.photos/seed/${Random().nextInt(999) + 1}/300/300')),
      ),
    );
  }
}
