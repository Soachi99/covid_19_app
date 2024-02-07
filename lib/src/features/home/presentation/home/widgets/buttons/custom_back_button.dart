import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 20,
        top: 20,
        child: IconButton(
          onPressed: () => context.go(Routes.login),
          icon: const Icon(
            Icons.exit_to_app,
            size: 30,
          ),
        ));
  }
}
