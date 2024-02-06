import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DialogService {
  void showErrorDialog(String message);
}

class DialogServiceImpl implements DialogService {
  final BuildContext context;

  DialogServiceImpl({required this.context});

  @override
  void showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: CustomText(message),
            ));
  }
}

final dialogServiceProvider = Provider<DialogService>((ref) {
  final context = ref.watch(navigatorKeyProvider).currentContext!;
  return DialogServiceImpl(context: context);
});
