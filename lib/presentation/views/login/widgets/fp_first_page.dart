import 'package:flutter/material.dart';
import 'package:healthy_pet_app/presentation/core/colors/app_colors.dart';

import '../../../core/shared_widgets/custom_text.dart';
import '../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../core/shared_widgets/secondary_button.dart';
import '../../../core/styles/app_styles.dart';
import '../login_controller.dart';

class FPFirstPage extends StatelessWidget {
  final LoginController controller;
  const FPFirstPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            '¿Olvidaste tu contraseña?',
            style: AppStyles.mavenPro20BoldDimGray,
          ),
          const SizedBox(height: 24),
          const CustomText(
            'Ingresa tu correo electrónico para el proceso de verificación. Enviaremos un código de 4 dígitos al destinatario registrado.',
            style: AppStyles.mavenPro16DimGray,
          ),
          const SizedBox(height: 48),
          CustomTextFormField(
            controller: controller.email2TextController,
            label: 'Correo electrónico',
            hintText: 'Ingrese su correo registrado',
            borderColor: AppColors.green,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 40),
          SecondaryButton(
            onPressed: () => controller.netxPage(),
            text: 'Siguiente',
          ),
        ],
      ),
    );
  }
}
