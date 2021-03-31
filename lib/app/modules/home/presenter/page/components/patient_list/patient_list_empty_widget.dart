import 'package:flutter/material.dart';

import '../../../../../../../core/themes/app_colors.dart';

class PatientListEmptyWidget extends StatefulWidget {
  @override
  _PatientListEmptyWidgetState createState() => _PatientListEmptyWidgetState();
}

class _PatientListEmptyWidgetState extends State<PatientListEmptyWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Empty list',
        textAlign: TextAlign.left,
        style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: 21,
            fontFamily: "Overpass",
            letterSpacing: 0),
      ),
    );
  }
}
