import 'package:flutter/material.dart';
import '../../../../../core/screen_utils.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../splash_screen_controller.dart';

class SplashScreenPage extends StatefulWidget {
  final String title;
  const SplashScreenPage({Key key, this.title = "SplashScreen"})
      : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState
    extends ModularState<SplashScreenPage, SplashScreenController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: ScreenUtils.screenWidth,
        height: ScreenUtils.screenHeight,
        child: Center(
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
