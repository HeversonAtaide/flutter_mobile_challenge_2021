import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';
import 'package:flutter_mobile_challenge_2021/core/widgets/failure_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_controller.dart';
import 'components/home_app_bar_widget.dart';
import 'components/patient_list/patient_list_content_widget.dart';
import 'components/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBarWidget(),
            SearchBarWidget(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
              child: controller.error != null
                  ? FailureWidget(controller.error, controller.fetchData)
                  : PatientListContentWidget(),
            )),
            Container(
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
