import 'package:flutter/material.dart';

import '../../core/colors/app_colors.dart';
import '../../core/icons/app_icons.dart';
import '../../core/shared_widgets/custom_text.dart';
import '../../core/shared_widgets/custom_text_button.dart';
import '../../core/shared_widgets/custom_text_form_field.dart';
import '../../core/shared_widgets/primary_button.dart';
import '../../core/styles/app_styles.dart';
import '../../core/utils/modals/modals.dart';
import 'login_controller.dart';
import 'widgets/forgot_password_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

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
                Image.asset(AppIcons.logo, width: 156),
                const SizedBox(height: 4),
                const CustomText(
                  'Healthy Pet',
                  style: AppStyles.lemonada24BoldBlack,
                ),
                const SizedBox(height: 48),
                const CustomText(
                  '¡Bienvenido!',
                  style: AppStyles.mavenPro20BoldBlack,
                ),
                const SizedBox(height: 36),
                CustomTextFormField(
                  controller: _controller.emailTextController,
                  hintText: 'Correo electrónico',
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  controller: _controller.passwordTextController,
                  hintText: 'Contraseña',
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                ),
                const SizedBox(height: 4),
                CustomTextButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Modals.showModal(
                      context,
                      horizontal: 0,
                      children: ForgotPasswordWidget(controller: _controller),
                      isScrollControlled: true,
                    );
                  },
                  text: '¿Olvidaste la contraseña?',
                  underline: false,
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  text: 'Iniciar sesión',
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
                      '  Ó ingresa con  ',
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
                    const CustomText('¿No tienes una cuenta?'),
                    const SizedBox(width: 8),
                    CustomTextButton(
                      onPressed: () => _controller.toSignUpPage(context),
                      text: 'Registrarse',
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
