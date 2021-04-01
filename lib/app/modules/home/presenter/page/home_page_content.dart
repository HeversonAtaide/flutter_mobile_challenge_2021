import 'package:flutter/material.dart';

import 'components/patient_list/patient_list_content_widget.dart';
import 'components/search_bar/search_bar_content_widget.dart';

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarContentWidget(),
        PatientListContentWidget(),
      ],
    );
  }
}
