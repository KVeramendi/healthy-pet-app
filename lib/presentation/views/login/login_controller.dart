import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';

class LoginController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  void init(BuildContext context) {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
  }

  void toSignUpPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.signUp);
  }
}
