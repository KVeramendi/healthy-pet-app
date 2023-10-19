import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import 'custom_text.dart';

class ChipSquareTextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final String? text;
  final TextStyle? style;
  const ChipSquareTextButton({
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          border: Border.all(color: borderColor ?? AppColors.black),
          borderRadius: BorderRadius.circular(4),
        ),
        width: width,
        height: height,
        child: CustomText(
          text,
          style: style,
        ),
      ),
    );
  }
}
