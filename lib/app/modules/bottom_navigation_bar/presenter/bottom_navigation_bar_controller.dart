import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/themes/app_colors.dart';

part 'bottom_navigation_bar_controller.g.dart';

@Injectable()
class BottomNavigationBarController = _BottomNavigationBarControllerBase
    with _$BottomNavigationBarController;

abstract class _BottomNavigationBarControllerBase with Store {
  PageController pageViewController;

  List<Widget> _routerBottomMenuList = [];

  List<Widget> get routerBottomMenuList => _routerBottomMenuList;

  @observable
  int _currentPage;

  @computed
  int get currentPage => _currentPage;

  _BottomNavigationBarControllerBase() {
    _init();
  }

  @action
  Future<void> _init() async {
    setCurrentPage(0);
    List<Widget> list = [
      // RouterOutlet(
      //   module: HomeModule(),
      // ),
      Container(
        color: AppColors.white,
      ),
      Container(
        color: AppColors.yellow,
      ),
      Container(
        color: AppColors.orange,
      ),
    ];
    setRouterBottomMenuList(list);
  }

  @action
  void setCurrentPage(int value) {
    _currentPage = value;
  }

  void setRouterBottomMenuList(List<Widget> list) {
    _routerBottomMenuList = list;
  }
}
