import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/widgets/failure_widget.dart';
import '../home_controller.dart';
import 'components/search_bar/search_bar_error_widget.dart';

class HomePageError extends StatefulWidget {
  @override
  _HomePageErrorState createState() => _HomePageErrorState();
}

class _HomePageErrorState extends State<HomePageError> {
  HomeController _homeController = Modular.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarErrorWidget(),
        FailureWidget(_homeController.error, _homeController.fetchData),
      ],
    );
  }
}
