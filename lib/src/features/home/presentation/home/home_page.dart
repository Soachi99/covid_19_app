import 'package:covid_19_app/src/features/home/domain/services/clock_provider.dart';
import 'package:covid_19_app/src/features/home/presentation/home/widgets/buttons/custom_back_button.dart';
import 'package:covid_19_app/src/features/home/presentation/home/widgets/covid_info_space.dart';
import 'package:covid_19_app/src/features/home/presentation/home/widgets/device_info_container.dart';
import 'package:covid_19_app/src/features/home/presentation/home/widgets/images/man_image.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:go_router/go_router.dart';

import 'home_controller.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () async => await ref.watch(homeController.notifier).onInit());
  }

  @override
  Widget build(BuildContext context) {
    final clockStream = ref.watch(clockProvider);
    var controller = ref.watch(homeController.notifier);
    var state = ref.watch(homeController);
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
            backgroundColor: customColors.black,
            foregroundColor: customColors.white,
            onPressed: () => context.go(Routes.details),
            child: const Icon(Icons.add)),
      ),
      backgroundColor: customColors.white,
      body: SafeArea(
          child: SizedBox.expand(
        child: Stack(
          children: [
            SizedBox(
              width: dimens.fullWidth(context),
              height: 250,
              child: Stack(
                children: [
                  const ManImage(),
                  SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(images.covid)),
                  const CustomBackButton(),
                ],
              ),
            ),
            CovidInfoSpace(state: state),
            DeviceInfoContainer(clockStream: clockStream, state: state),
            Padding(
              padding: EdgeInsets.only(left: dimens.fullWidth(context) * .6),
              child: FlutterSwitch(
                value: state.isDarkTheme ?? false,
                activeIcon: const Icon(Icons.dark_mode),
                inactiveIcon: const Icon(Icons.light_mode),
                activeColor: customColors.orange,
                inactiveColor: customColors.black,
                onToggle: (value) => controller.toggleTheme(value),
              ),
            )
          ],
        ),
      )),
    );
  }
}
