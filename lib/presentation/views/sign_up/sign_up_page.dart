import 'package:flutter/material.dart';

import '../../core/colors/app_colors.dart';
import '../../core/icons/app_icons.dart';
import '../../core/shared_widgets/custom_text.dart';
import '../../core/shared_widgets/custom_text_button.dart';
import '../../core/shared_widgets/custom_text_form_field.dart';
import '../../core/shared_widgets/primary_button.dart';
import '../../core/styles/app_styles.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final SignUpController _controller = SignUpController();

  @override
  void initState() {
    super.initState();
    _controller.init(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const CustomText('Crear nueva cuenta',
                    style: AppStyles.lemonada24BoldBlack),
                const SizedBox(height: 48),
                CustomTextFormField(
                  controller: _controller.fullNameTextController,
                  hintText: 'Nombre completo',
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: _controller.emailTextController,
                  hintText: 'Correo electrónico',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: _controller.password1TextController,
                  hintText: 'Contraseña',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: _controller.password2TextController,
                  hintText: 'Confirmar contraseña',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  onPressed: () {},
                  text: 'Registrarse',
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 1,
                        child: ColoredBox(color: AppColors.lightGray),
                      ),
                    ),
                    CustomText(
                      '  Ó registrate con  ',
                      style: AppStyles.mavenPro14Gray,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 1,
                        child: ColoredBox(color: AppColors.lightGray),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppIcons.facebook, width: 36),
                    ),
                    const SizedBox(width: 48),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppIcons.google, width: 36),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText('¿Ya tienes una cuenta?'),
                    const SizedBox(width: 8),
                    CustomTextButton(
                      onPressed: () => Navigator.pop(context),
                      text: 'Ingresar',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
