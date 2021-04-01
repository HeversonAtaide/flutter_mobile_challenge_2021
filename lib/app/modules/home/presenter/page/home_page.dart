import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/themes/app_colors.dart';
import '../home_controller.dart';
import 'components/app_bar/home_app_bar_widget.dart';
import 'home_page_content.dart';
import 'home_page_error.dart';
import 'home_page_loading.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBarWidget(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: Observer(
                builder: (_) {
                  return controller.error != null
                      ? HomePageError()
                      : controller.isLoading && controller.patients.isEmpty
                          ? HomePageLoading()
                          : HomePageContent();
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
