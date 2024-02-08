import 'package:covid_19_app/src/features/home/domain/entities/states_current.dart';
import 'package:covid_19_app/src/features/home/presentation/details/widgets/details_container.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'details_controller.dart';

class DetailsPage extends ConsumerStatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<DetailsPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () async => ref.watch(detailsController.notifier).onInit());
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(detailsController.notifier);
    var state = ref.watch(detailsController);
    return Scaffold(
      backgroundColor: customColors.white,
      appBar: AppBar(
        backgroundColor: customColors.grey,
        title: const CustomText('Detalles por estado'),
        leading: IconButton(
            onPressed: () => context.go(Routes.home),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
              children: state.states != null
                  ? state.states!.map((e) {
                      StatesCurrent statesCurrent = state.statesCurrent!
                          .where((element) => element.state == e.state)
                          .first;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: DetailsContainer(
                          state: e,
                          stateCurrent: statesCurrent,
                        ),
                      );
                    }).toList()
                  : []),
        ),
      )),
    );
  }
}
