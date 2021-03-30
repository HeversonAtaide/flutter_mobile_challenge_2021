import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/bottom_navigation_bar_controller.dart';
import 'presenter/bottom_navigation_bar_page.dart';

class BottomNavigationBarModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BottomNavigationBarController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => BottomNavigationBarPage()),
      ];

  static Inject get to => Inject<BottomNavigationBarModule>.of();
}
