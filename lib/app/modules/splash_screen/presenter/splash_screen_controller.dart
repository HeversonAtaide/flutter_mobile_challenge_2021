import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'splash_screen_controller.g.dart';

@Injectable()
class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
