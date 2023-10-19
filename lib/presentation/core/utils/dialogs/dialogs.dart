import 'package:flutter/material.dart';

import '../../colors/app_colors.dart';
import '../../styles/app_styles.dart';

class Dialogs {
  static Future<DateTime?> datePicker(
    BuildContext context, {
    DateTime? initialDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2900),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: 'FECHA',
      cancelText: 'CANCELAR',
      confirmText: 'ACEPTAR',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.orange,
              onPrimary: AppColors.white,
              onSurface: AppColors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.orange,
              ),
            ),
          ),
          child: child!,
        );
      },
      initialDatePickerMode: DatePickerMode.day,
      fieldLabelText: 'Ingrese la fecha',
    );
  }

  static Future<bool?> questionAlertDialog(
    BuildContext context, {
    String? title,
    required String content,
    VoidCallback? cancel,
    VoidCallback? accept,
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null
              ? Text(title, style: AppStyles.mavenPro14DarkGray)
              : null,
          content: Text(content, style: AppStyles.mavenPro14DarkGray),
          actions: [
            TextButton(
              onPressed: cancel ?? () => Navigator.pop(context, false),
              child: const Text('No', style: AppStyles.mavenPro14DarkGray),
            ),
            TextButton(
              onPressed: accept ?? () => Navigator.pop(context, true),
              child: const Text(
                'Sí',
                style: AppStyles.mavenPro14BoldOrange,
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
    );
  }

  static void alertDialog(
    BuildContext context, {
    String? title,
    required String content,
  }) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title != null
              ? Text(title, style: AppStyles.mavenPro14DarkGray)
              : null,
          content: Text(content, style: AppStyles.mavenPro14DarkGray),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Cerrar',
                style: AppStyles.mavenPro16Blue,
              ),
            ),
          ],
          actionsPadding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      },
    );
  }
}
