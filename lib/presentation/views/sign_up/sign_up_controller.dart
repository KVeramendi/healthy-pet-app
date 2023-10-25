import 'package:flutter/material.dart';

class SignUpController {
  late TextEditingController fullNameTextController;
  late TextEditingController emailTextController;
  late TextEditingController password1TextController;
  late TextEditingController password2TextController;

  void init(BuildContext context) {
    fullNameTextController = TextEditingController();
    emailTextController = TextEditingController();
    password1TextController = TextEditingController();
    password2TextController = TextEditingController();
  }

  void dispose() {
    fullNameTextController.dispose();
    emailTextController.dispose();
    password1TextController.dispose();
    password2TextController.dispose();
  }
}
