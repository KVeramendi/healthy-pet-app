import '../colors/app_colors.dart';
import '../styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchInputText extends StatelessWidget {
  final double padding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hintText;
  final bool searchIcon;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final VoidCallback? onEditionCompleted;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  const SearchInputText({
    Key? key,
    this.padding = 0,
    this.controller,
    this.focusNode,
    this.hintText = 'Buscar',
    this.searchIcon = true,
    this.textInputAction = TextInputAction.done,
    this.onChanged,
    this.onTap,
    this.onEditionCompleted,
    this.onFieldSubmitted,
    this.inputFormatters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppStyles.mavenPro14LightGray,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          prefixIcon: searchIcon
              ? const UnconstrainedBox(
                  child: ImageIcon(
                    AssetImage('assets/icons/menu/search.png'),
                    color: AppColors.lightGray,
                    size: 16.0,
                  ),
                )
              : null,
          filled: true,
          fillColor: AppColors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.orange),
            borderRadius: BorderRadius.circular(4.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.lightGray),
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
        textInputAction: textInputAction,
        style: AppStyles.mavenPro14DarkGray,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditionCompleted,
        onFieldSubmitted: onFieldSubmitted,
        inputFormatters: inputFormatters,
        cursorColor: AppColors.orange,
      ),
    );
  }
}
