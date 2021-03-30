import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/page/splash_screen_page.dart';
import 'presenter/splash_screen_controller.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashScreenController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}
