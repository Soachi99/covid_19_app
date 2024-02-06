import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FormService {
  bool validateForm();
  GlobalKey<FormState> getFormKey();
  TextEditingController getTecUserName();
  TextEditingController getTecPassword();
}

class FormServiceImpl implements FormService {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: '_loginDataFormKey');

  TextEditingController tecUserName = TextEditingController();
  TextEditingController tecPassword = TextEditingController();

  @override
  bool validateForm() {
    return formKey.currentState!.validate();
  }

  @override
  GlobalKey<FormState> getFormKey() => formKey;

  @override
  TextEditingController getTecPassword() => tecPassword;

  @override
  TextEditingController getTecUserName() => tecUserName;
}

final formServiceProvider = Provider<FormService>((ref) {
  return FormServiceImpl();
});
