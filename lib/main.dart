import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/datasources/remote/internet_checker.dart';
import 'data/repositories_impl/connectivity_repository_impl.dart';
import 'domain/repositories/connectivity_repository.dart';
import 'presentation/core/colors/app_colors.dart';
import 'presentation/core/routes/app_routes.dart';
import 'presentation/core/routes/routes.dart';
import 'presentation/views/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      Provider<ConnectivityRepository>(
        create: (context) => ConnectivityRepositoryImpl(
          Connectivity(),
          InternetChecker(),
        ),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MaterialApp(
        home: const SafeArea(child: Scaffold(body: SplashPage())),
        title: 'Healthy Pet',
        theme: ThemeData(
          primaryColor: AppColors.black,
          fontFamily: 'MavenPro',
        ),
        routes: appRoutes,
        initialRoute: Routes.splash,
        debugShowCheckedModeBanner: false,
      ),
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
