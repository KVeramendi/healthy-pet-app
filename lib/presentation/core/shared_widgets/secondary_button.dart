import '../colors/app_colors.dart';
import 'custom_text.dart';
import '../styles/app_styles.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final double padding;
  final bool isExpanded;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final bool outlineStyle;
  final bool rippleEffect;
  const SecondaryButton({
    Key? key,
    this.padding = 0,
    this.isExpanded = true,
    this.height = 46.0,
    required this.onPressed,
    required this.text,
    this.outlineStyle = false,
    this.rippleEffect = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        width: isExpanded ? double.infinity : null,
        height: height,
        child: ElevatedButton(
          onPressed: onPressed,
          style: outlineStyle
              ? ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  side: const BorderSide(color: AppColors.lightOrange),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ).copyWith(
                  overlayColor: rippleEffect
                      ? MaterialStateProperty.all(AppColors.lightGray)
                      : MaterialStateProperty.all(AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                )
              : ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightOrange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0)),
                ).copyWith(
                  overlayColor: rippleEffect
                      ? null
                      : MaterialStateProperty.all(AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
          child: CustomText(
            text,
            style: AppStyles.mavenPro16BoldDarkOrange,
          ),
        ),
      ),
    );
  }
}
