import 'package:covid_19_app/src/features/splash_screen/presentation/splash_screen/widgets/loading_bar.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends ConsumerWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: customColors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            images.covid,
            height: 250,
          ),
          const Spacer(),
          const LoadingBar(),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
