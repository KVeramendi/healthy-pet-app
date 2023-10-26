import 'package:flutter/material.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/shared_widgets/custom_text.dart';
import '../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../core/shared_widgets/secondary_button.dart';
import '../../../core/styles/app_styles.dart';
import '../login_controller.dart';

class FPThirdPage extends StatelessWidget {
  final LoginController controller;
  const FPThirdPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Restablecer la contraseña',
            style: AppStyles.mavenPro20BoldDimGray,
          ),
          const SizedBox(height: 24),
          const CustomText(
            'Establece una nueva contraseña para tu cuenta, de manera que puedas iniciar sesión y acceder a todos los beneficios.',
            style: AppStyles.mavenPro16DimGray,
          ),
          const SizedBox(height: 48),
          CustomTextFormField(
            controller: controller.fPPassword1TextController,
            label: 'Nueva contraseña',
            hintText: 'Ingrese la nueva contraseña',
            obscureText: true,
            borderColor: AppColors.green,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            controller: controller.fPPassword2TextController,
            label: 'Repetir contraseña',
            hintText: 'Ingrese nuevamente la contraseña',
            obscureText: true,
            borderColor: AppColors.green,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 40),
          SecondaryButton(
            onPressed: () => Navigator.pop(context),
            text: 'Restablecer',
          ),
        ],
      ),
    );
  }
}
