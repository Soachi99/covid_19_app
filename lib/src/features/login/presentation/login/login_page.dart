import 'package:covid_19_app/src/features/login/domain/services/form_service.dart';
import 'package:covid_19_app/src/features/login/presentation/login/login_controller.dart';
import 'package:covid_19_app/src/features/login/presentation/login/login_state.dart';
import 'package:covid_19_app/src/features/login/presentation/login/widgets/woman_image.dart';
import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/buttons/custom_button.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:covid_19_app/src/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'widgets/custom_icon.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref.watch(loginController.notifier).initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    LoginState state = ref.watch(loginController);
    LoginController controller = ref.watch(loginController.notifier);
    FormService formService = ref.watch(formServiceProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: customColors.white,
      body: SafeArea(
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Form(
              key: formService.getFormKey(),
              child: Column(
                children: [
                  const WomanImage(),
                  LoginForm(
                    controller: controller,
                    formService: formService,
                    state: state,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final FormService formService;
  final LoginController controller;
  final LoginState state;

  const LoginForm({
    super.key,
    required this.controller,
    required this.state,
    required this.formService,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController tecUserName = formService.getTecUserName();
    TextEditingController tecPassword = formService.getTecPassword();
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          CustomTextFormField(
              inputValueType: InputValueType.documentType,
              label: 'Tipo Documento:',
              onChanged: (p0) {
                state.firstValidation! ? formService.validateForm() : null;
              }),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              inputValueType: InputValueType.document,
              label: 'Número de documento:',
              controller: tecUserName,
              onChanged: (p0) {
                state.firstValidation! ? formService.validateForm() : null;
              }),
          const SizedBox(
            height: 8,
          ),
          CustomTextFormField(
              inputValueType: InputValueType.password,
              label: 'Contraseña:',
              suffixIconEnabled: true,
              controller: tecPassword,
              onChanged: (p0) {
                state.firstValidation! ? formService.validateForm() : null;
              }),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
              label: 'Login',
              onTap: () =>
                  controller.verify(tecUserName.text, tecPassword.text)),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => Fluttertoast.showToast(msg: 'Registrar Usuario'),
            child: const CustomText(
              'Registrar Usuario',
              textDecoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomIcon(
                message: 'Google',
                pathIcon: icons.google,
              ),
              CustomIcon(
                message: 'Facebook',
                pathIcon: icons.facebook,
              ),
              CustomIcon(
                message: 'Instagram',
                pathIcon: icons.instagram,
              )
            ],
          )
        ],
      ),
    );
  }
}
