import 'package:flutter/material.dart';

import '../../core/shared_widgets/custom_text.dart';
import '../../core/styles/app_styles.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                'LoginPage',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
