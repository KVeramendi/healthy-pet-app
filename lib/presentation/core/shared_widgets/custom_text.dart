import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../styles/app_styles.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final TextStyle? style;
  final AutoSizeGroup? group;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  const CustomText(
    this.text, {
    Key? key,
    this.style = AppStyles.mavenPro14Black,
    this.group,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text ?? '',
      style: style,
      minFontSize: 8,
      group: group,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
