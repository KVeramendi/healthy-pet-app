import 'package:flutter/material.dart';

import '../../../core/shared_widgets/custom_text.dart';
import '../../../core/shared_widgets/pin_code_input_text.dart';
import '../../../core/shared_widgets/secondary_button.dart';
import '../../../core/styles/app_styles.dart';
import '../login_controller.dart';

class FPSecondPage extends StatelessWidget {
  final LoginController controller;
  const FPSecondPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            'Ingresar los 4 dígitos del código',
            style: AppStyles.mavenPro20BoldDimGray,
          ),
          const SizedBox(height: 24),
          const CustomText(
            'Ingrese los 4 dígitos del código que acaba de recibir en su correo electrónico.',
            style: AppStyles.mavenPro16DimGray,
          ),
          const SizedBox(height: 48),
          Align(
            alignment: Alignment.center,
            child: PinCodeInputText(
              lenght: 4,
              controller: controller.pinCodeController,
              focusNode: controller.pinCodeNode,
            ),
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
