import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../colors/app_colors.dart';
import '../styles/app_styles.dart';

class PinCodeInputText extends StatelessWidget {
  final int lenght;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const PinCodeInputText({
    Key? key,
    this.lenght = 6,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: AppStyles.mavenPro20BoldDimGray,
      decoration: BoxDecoration(
        color: AppColors.lightGrayS,
        borderRadius: BorderRadius.circular(12),
      ),
    );

    return Pinput(
      length: lenght,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: AppColors.green),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: AppColors.red,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      controller: controller,
      focusNode: focusNode,
      mainAxisAlignment: MainAxisAlignment.center,
      pinAnimationType: PinAnimationType.fade,
      showCursor: true,
      cursor: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(12),
            ),
            width: 30,
            height: 1,
            margin: const EdgeInsets.only(bottom: 8),
          ),
        ],
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
