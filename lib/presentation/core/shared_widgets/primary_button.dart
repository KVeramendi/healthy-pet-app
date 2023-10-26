import '../colors/app_colors.dart';
import 'custom_text.dart';
import '../styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'loading_indicator.dart';

class PrimaryButton extends StatefulWidget {
  final double padding;
  final bool isExpanded;
  final double height;
  final VoidCallback? onPressed;
  final String text;
  final bool outlineStyle;
  final bool rippleEffect;
  const PrimaryButton({
    Key? key,
    this.padding = 0,
    this.isExpanded = true,
    this.height = 46,
    required this.onPressed,
    required this.text,
    this.outlineStyle = false,
    this.rippleEffect = true,
  }) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isLoading = false;

  void _onPressed() {
    final onPressed = widget.onPressed;
    if (onPressed == null) return;
    if (onPressed is Future Function()) {
      _handleAsyncPressed(onPressed);
    } else {
      _handleSyncPressed(onPressed);
    }
  }

  Future<void> _handleAsyncPressed(Future<void> Function() onPressed) async {
    setState(() => _isLoading = true);
    await onPressed();
    setState(() => _isLoading = false);
  }

  void _handleSyncPressed(VoidCallback onPressed) => onPressed();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding),
      child: SizedBox(
        width: widget.isExpanded ? double.infinity : null,
        height: widget.height,
        child: ElevatedButton(
          onPressed: widget.onPressed != null ? _onPressed : null,
          style: widget.outlineStyle
              ? ElevatedButton.styleFrom(
                  backgroundColor: AppColors.transparent,
                  side: const BorderSide(color: AppColors.orange),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ).copyWith(
                  overlayColor: widget.rippleEffect
                      ? MaterialStateProperty.all(AppColors.lightGrayS)
                      : MaterialStateProperty.all(AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                )
              : ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ).copyWith(
                  overlayColor: widget.rippleEffect
                      ? null
                      : MaterialStateProperty.all(AppColors.transparent),
                  elevation: MaterialStateProperty.all(0),
                ),
          child: _isLoading
              ? const LoadingIndicator(dimension: 20, color: AppColors.tomato)
              : CustomText(
                  widget.text,
                  style: widget.outlineStyle
                      ? AppStyles.mavenPro16BoldOrange
                      : AppStyles.mavenPro16BoldWhite,
                ),
        ),
      ),
    );
  }
}
