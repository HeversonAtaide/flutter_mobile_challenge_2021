import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_controller.g.dart';

@Injectable()
class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  _SplashScreenControllerBase() {
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(Duration(seconds: 1), () async {});
    await Modular.to.popAndPushNamed('/bottom_navigation_bar');
  }
}
