import '../../views/login/login_page.dart';
import 'package:flutter/material.dart';

import '../../views/splash/splash_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (_) => const SplashPage(),
    Routes.login: (_) => const LoginPage(),
  };
}
