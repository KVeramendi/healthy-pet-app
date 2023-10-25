import '../colors/app_colors.dart';
import 'custom_text.dart';
import '../styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final bool isExpanded;
  final double? height;
  final String? label;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? hintText;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextAlignVertical textAlignVertical;
  final bool readOnly;
  final bool showCursor;
  final bool obscureText;
  final int? maxLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditionCompleted;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const CustomTextFormField({
    Key? key,
    this.isExpanded = true,
    this.height,
    this.label,
    this.labelStyle = AppStyles.mavenPro14BoldGray,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.hintText,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textAlignVertical = TextAlignVertical.center,
    this.readOnly = false,
    this.showCursor = true,
    this.obscureText = false,
    this.maxLines = 1,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditionCompleted,
    this.onFieldSubmitted,
    this.validator,
    this.inputFormatters,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: widget.isExpanded ? 0 : 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            CustomText(
              widget.label!,
              style: widget.labelStyle,
              maxLines: 1,
            ),
          if (widget.label != null) const SizedBox(height: 4),
          SizedBox(
            height: widget.height,
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.initialValue,
              focusNode: widget.focusNode,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppStyles.mavenPro14Gray,
                errorStyle: AppStyles.mavenPro11Red,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 16,
                ),
                suffixIcon: widget.obscureText
                    ? IconButton(
                        splashRadius: 24,
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                        icon: _obscureText
                            ? const Icon(Icons.visibility_off_rounded)
                            : const Icon(Icons.visibility_rounded))
                    : null,
                counterText: '',
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.red),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.orange),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  gapPadding: 16,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.lightGray),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              keyboardType:
                  widget.readOnly ? TextInputType.none : widget.keyboardType,
              textInputAction: widget.textInputAction,
              style: AppStyles.mavenPro14Black,
              textAlignVertical: widget.textAlignVertical,
              readOnly: widget.readOnly,
              showCursor: widget.readOnly ? false : widget.showCursor,
              obscureText: widget.obscureText ? _obscureText : false,
              maxLines: widget.maxLines,
              expands: widget.expands,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              onEditingComplete: widget.onEditionCompleted,
              onFieldSubmitted: widget.onFieldSubmitted,
              validator: (value) => widget.validator!(value ?? ''),
              inputFormatters: widget.inputFormatters,
              cursorColor: AppColors.orange,
              scrollPadding: EdgeInsets.zero,
            ),
          ),
        ],
      ),
    );
  }
}
