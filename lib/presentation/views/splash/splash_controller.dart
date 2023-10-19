import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/repositories/connectivity_repository.dart';
import '../../core/routes/routes.dart';

class SplashController {
  late ConnectivityRepository _connectivityRepository;

  void init(BuildContext context) {
    _connectivityRepository = context.read();
  }

  void connectivity(BuildContext context) async {
    final response = await hasInternet();
    if (response) {
      if (context.mounted) return toLoginPage(context);
    }
    return debugPrint('No hubo conexion a internet');
  }

  Future<bool> hasInternet() async {
    return await _connectivityRepository.hasInternet;
  }

  // Future<void> init2(BuildContext context) async {
  //   // final AuthenticationRepository authenticationRepository = context.read();
  //   //   final isLoggedIn = await authenticationRepository.isLoggedIn;
  //   //   if (isLoggedIn) {
  //   //     final user = await authenticationRepository.getUserData();
  //   if (context.mounted) {
  //     debugPrint('¡Conexion exitosa!');
  //     toLoginPage(context);
  //   }
  //   //     if (user != null) {
  //   //       _controller.toDashboardPage(context);
  //   // } else {
  //   //     }
  // }

  void toLoginPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.login);
  }
}
