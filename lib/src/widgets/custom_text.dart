import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:covid_19_app/src/tools/tools.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  const CustomText(
    this.text, {
    Key? key,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
    this.maxLines,
    this.textAlign,
    this.fontSize = 16,
    this.overflow,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text ?? '',
        textAlign: textAlign,
        maxLines: maxLines ?? 100,
        overflow: overflow,
        style: GoogleFonts.redHatDisplay(
            fontWeight: fontWeight ?? FontWeight.w400,
            fontSize: fontSize ?? 16,
            color: textColor ?? customColors.black,
            decoration: textDecoration ?? TextDecoration.none,
            height: height));
  }
}
