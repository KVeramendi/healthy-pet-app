import 'package:flutter/material.dart';

import '../../core/routes/routes.dart';

class LoginController {
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;
  late PageController pageController;
  late TextEditingController email2TextController;
  late TextEditingController pinCodeController;
  late FocusNode pinCodeNode;
  late TextEditingController fPPassword1TextController;
  late TextEditingController fPPassword2TextController;

  void init(BuildContext context) {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    pageController = PageController();
    email2TextController = TextEditingController();
    pinCodeController = TextEditingController();
    pinCodeNode = FocusNode();
    fPPassword1TextController = TextEditingController();
    fPPassword2TextController = TextEditingController();
  }

  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    pageController.dispose();
    email2TextController.dispose();
    pinCodeController.dispose();
    pinCodeNode.dispose();
    fPPassword1TextController.dispose();
    fPPassword2TextController.dispose();
  }

  void toSignUpPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.signUp);
  }

  void netxPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
    );
  }
}
