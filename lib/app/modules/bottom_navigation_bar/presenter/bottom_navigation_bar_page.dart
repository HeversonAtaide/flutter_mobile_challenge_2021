import 'package:connection_status_bar/connection_status_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/themes/app_colors.dart';
import 'bottom_navigation_bar_controller.dart';

class BottomNavigationBarPage extends StatefulWidget {
  final String title;
  const BottomNavigationBarPage({Key key, this.title = "BottomNavigationBar"})
      : super(key: key);

  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState
    extends ModularState<BottomNavigationBarPage, BottomNavigationBarController>
    with TickerProviderStateMixin {
  PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: new NeverScrollableScrollPhysics(),
            controller: _pageViewController,
            children: controller.routerBottomMenuList,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConnectionStatusBar(
              endOffset: const Offset(0.0, 0.0),
              beginOffset: const Offset(0.0, -1.0),
              title: const Text(
                'Sem conexão com a internet',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: "Overpass",
                  letterSpacing: 0,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _bottomNavigationBar() {
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.secondBlue,
          onTap: (value) {
            controller.setCurrentPage(value);
            _pageViewController.jumpToPage(controller.currentPage);
          },
          currentIndex: controller.currentPage,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/bottom_menu_icons/home.svg',
                color: controller.currentPage == 0
                    ? AppColors.primaryBlue
                    : AppColors.secondBlue,
              ),
              label: "Início",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/bottom_menu_icons/home.svg',
                color: controller.currentPage == 1
                    ? AppColors.primaryBlue
                    : AppColors.secondBlue,
              ),
              label: "Menu 2",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/bottom_menu_icons/home.svg',
                color: controller.currentPage == 2
                    ? AppColors.primaryBlue
                    : AppColors.secondBlue,
              ),
              label: "Menu 3",
            ),
          ],
        );
      },
    );
  }
}
