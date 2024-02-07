import 'package:covid_19_app/src/tools/tools.dart';
import 'package:covid_19_app/src/tools/validators.dart';
import 'package:covid_19_app/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  /// Titulo input.
  final String label;

  /// Text controller.
  final TextEditingController? controller;

  /// Tipo de dato que se ingresará en el formulario.
  final InputValueType? inputValueType;

  /// HintText del textFormField.
  final String? hintText;

  /// Habilitar el uso del SuffixIcon
  final bool? suffixIconEnabled;

  /// Ubicación icono de suffix;
  final String? suffixIconPath;

  //Funcion para detectar los cambios en los inputs
  final Function(String)? onChanged;

  /// Funcion que se ejecuta al presionar el SuffixIcon
  final Function? onTapSuffixIcon;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.controller,
    this.inputValueType = InputValueType.document,
    this.hintText,
    this.suffixIconEnabled = false,
    this.suffixIconPath,
    this.onChanged,
    this.onTapSuffixIcon,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  FocusNode focusNode = FocusNode();
  bool obscureText = false;
  bool? showError = false;
  String? errorMessage;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });

    Future.delayed(
      Duration.zero,
      () => {
        _defineObscureTextValue(),
        _addTextControllerListener(),
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            CustomText(
              widget.label,
              fontSize: 16,
              textColor: customColors.black,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: customColors.white,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: _accentColor(), width: 1),
          ),
          child: TextFormField(
            focusNode: focusNode,
            controller: widget.controller,
            validator: (x) => _validateInput(x ?? ''),
            onChanged: widget.onChanged,
            textInputAction: TextInputAction.none,
            style: const TextStyle(
              fontFamily: "Roboto",
              color: Colors.black,
              fontSize: 16,
            ),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              isCollapsed: true,
              errorStyle: TextStyle(
                fontSize: 0,
                color: customColors.red,
              ),
              hintStyle: TextStyle(
                color: customColors.grey,
                fontFamily: "Roboto",
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: widget.suffixIconEnabled!
                  ? IconButton(
                      onPressed: () => onTapSuffixIcon(),
                      icon: const Icon(Icons.remove_red_eye_outlined))
                  : null,
            ),
            keyboardType: _keyboardType(),
            inputFormatters: [
              if (widget.inputValueType == InputValueType.document) ...[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(13),
              ],
            ],
            obscureText: obscureText,
            obscuringCharacter: "*",
            cursorHeight: 24,
            cursorWidth: 1,
            cursorColor: Colors.black,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              /// Mensaje error
              if (showError! && errorMessage != "") ...[
                const SizedBox(height: 11),
                Row(
                  children: [
                    CustomText(
                      errorMessage ?? "Esto es un error",
                      textColor: customColors.red,
                      fontSize: 14,
                    ),
                  ],
                ),
              ]
            ],
          ),
        )
      ],
    );
  }

  void onTapSuffixIcon() {
    obscureText = !obscureText;
    setState(() {});
  }

  Color _accentColor() {
    if (showError!) {
      return customColors.red;
    }
    return focusNode.hasFocus ? customColors.black : customColors.grey;
  }

  _defineObscureTextValue() {
    setState(() {
      obscureText = (widget.inputValueType == InputValueType.password);
    });
  }

  _validate(String text) {
    switch (widget.inputValueType) {
      case InputValueType.document:
        errorMessage = validateDocument(text);
        break;
      case InputValueType.password:
        errorMessage = validatePassword(text);
        break;
      default:
        //errorMessage = validateText(text, matchValue: widget.matchValue);
        break;
    }
    showError = errorMessage != null;
    return errorMessage;
  }

  _addTextControllerListener() {
    if (widget.controller != null) {
      widget.controller!.addListener(() {});
    }
  }

  String? _validateInput(String x) {
    _validate(x);
    setState(() {});
    return errorMessage;
  }

  _keyboardType() {
    switch (widget.inputValueType) {
      default:
        return TextInputType.text;
    }
  }
}

enum InputValueType {
  documentType,
  document,
  password,
}
