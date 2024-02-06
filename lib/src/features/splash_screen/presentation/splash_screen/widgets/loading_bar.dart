import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingBar extends StatefulWidget {
  final int? loadTime;

  const LoadingBar({super.key, this.loadTime = 10});

  @override
  State<LoadingBar> createState() => _LoadingBarState();
}

class _LoadingBarState extends State<LoadingBar> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.loadTime!),
      upperBound: 1,
    );

    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.go(Routes.login);
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomText(
          'Loading...',
          fontWeight: FontWeight.bold,
        ),
        Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
          decoration: BoxDecoration(
              border: Border.all(color: customColors.black, width: 2),
              color: customColors.white),
          height: 35,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [customColors.black, customColors.white],
                    stops: [controller.value, controller.value])),
          ),
        ),
        CustomText(
          '${(controller.value * 100).toStringAsFixed(0)}%',
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
