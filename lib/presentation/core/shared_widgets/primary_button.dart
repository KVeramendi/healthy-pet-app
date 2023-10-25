import '../colors/app_colors.dart';
import 'custom_text.dart';
import '../styles/app_styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final double padding;
  final bool isExpanded;
  final double height;
  final VoidCallback onPressed;
  final String text;
  final bool outlineStyle;
  final bool rippleEffect;
  final bool fetching;
  const PrimaryButton({
    Key? key,
    this.padding = 0,
    this.isExpanded = true,
    this.height = 46,
    required this.onPressed,
    required this.text,
    this.outlineStyle = false,
    this.rippleEffect = true,
    this.fetching = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        width: isExpanded ? double.infinity : null,
        height: height,
        child: ElevatedButton(
          onPressed: fetching ? () {} : onPressed,
          style: outlineStyle
              ? ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  side: const BorderSide(color: AppColors.orange),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ).copyWith(
                  overlayColor: rippleEffect
                      ? MaterialStateProperty.all(AppColors.lightGray)
                      : MaterialStateProperty.all(AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                )
              : ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ).copyWith(
                  overlayColor: rippleEffect
                      ? null
                      : MaterialStateProperty.all(AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
          child: fetching
              ? const SizedBox.square(
                  dimension: 24,
                  child: CircularProgressIndicator(color: AppColors.white),
                )
              : CustomText(
                  text,
                  style: outlineStyle
                      ? AppStyles.mavenPro16BoldOrange
                      : AppStyles.mavenPro16BoldWhite,
                ),
        ),
      ),
    );
  }
}
