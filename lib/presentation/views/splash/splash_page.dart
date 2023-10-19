import '../../core/shared_widgets/loading_indicator.dart';
import 'splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController _controller = SplashController();

  @override
  void initState() {
    super.initState();
    _controller.init(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.connectivity(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: LoadingIndicator()));
  }
}
