import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/widgets/buttons/custom_button.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:covid_19_app/src/widgets/inputs/custom_text_form_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginPage> {
  GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: '_loginDataFormKey');

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: customColors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: const Column(
            children: [WomanImage(), LoginForm()],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        children: [
          const CustomTextFormField(label: 'Tipo Documento:'),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(label: 'Número de documento:'),
          const SizedBox(
            height: 8,
          ),
          const CustomTextFormField(
            label: 'Contraseña:',
            suffixIconEnabled: true,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(label: 'Login', onTap: () {}),
          const Row(
            children: [],
          )
        ],
      ),
    );
  }
}

class WomanImage extends StatelessWidget {
  const WomanImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          images.woman,
        ),
        const Positioned(
            bottom: 0,
            child: Padding(
              padding: EdgeInsets.only(bottom: 8, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    'Bienvenido a:',
                    fontSize: 12,
                    textAlign: TextAlign.left,
                  ),
                  CustomText(
                    '   Evertec',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    height: 1.2,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
