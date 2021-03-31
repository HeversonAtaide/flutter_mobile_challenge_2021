import 'package:flutter/material.dart';

import 'components/patient_list/patient_list_loading_widget.dart';
import 'components/search_bar/search_bar_loading_widget.dart';

class HomePageLoading extends StatefulWidget {
  @override
  _HomePageLoadingState createState() => _HomePageLoadingState();
}

class _HomePageLoadingState extends State<HomePageLoading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarLoadingWidget(),
        PatientListLoadingWidget(),
      ],
    );
  }
}
