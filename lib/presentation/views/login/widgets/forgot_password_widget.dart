import 'package:flutter/material.dart';

import '../login_controller.dart';
import 'fp_first_page.dart';
import 'fp_second_page.dart';
import 'fp_third_page.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final LoginController controller;
  const ForgotPasswordWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          FPFirstPage(controller: controller),
          FPSecondPage(controller: controller),
          FPThirdPage(controller: controller),
        ],
      ),
    );
  }
}
