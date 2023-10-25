import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final AlignmentGeometry alignment;
  final VoidCallback onPressed;
  final String text;
  final bool underline;
  const CustomTextButton({
    Key? key,
    this.alignment = Alignment.center,
    required this.onPressed,
    required this.text,
    this.underline = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: CustomText(text, style: AppStyles.mavenPro14BoldOrange),
      ),
    );
  }
}
