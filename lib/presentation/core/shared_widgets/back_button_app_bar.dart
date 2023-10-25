import '../colors/app_colors.dart';
import '../styles/app_styles.dart';
import 'package:flutter/material.dart';

class BackButtonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool backButtonVisible;
  final VoidCallback? onPressed;
  final String title;
  final bool blankColor;
  final List<Widget>? actions;
  const BackButtonAppBar({
    Key? key,
    this.backButtonVisible = true,
    this.onPressed,
    this.title = '',
    this.blankColor = false,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButtonVisible
          ? IconButton(
              splashRadius: 24.0,
              onPressed: onPressed ?? () => Navigator.maybePop(context),
              icon: Icon(
                Icons.arrow_back_rounded,
                color: blankColor ? AppColors.white : AppColors.dimGray,
              ),
            )
          : null,
      automaticallyImplyLeading: backButtonVisible ? true : false,
      title: Text(
        title,
        style: blankColor
            ? AppStyles.mavenPro20BoldWhite
            : AppStyles.mavenPro20BoldDimGray,
      ),
      actions: actions,
      elevation: 0,
      backgroundColor: AppColors.transparent,
      titleSpacing: backButtonVisible ? 0 : 16,
    );
  }
}
