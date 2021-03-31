import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';

class PatientListLoadingWidget extends StatefulWidget {
  @override
  _PatientListLoadingWidgetState createState() =>
      _PatientListLoadingWidgetState();
}

class _PatientListLoadingWidgetState extends State<PatientListLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148,
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            'Loading more...',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: AppColors.green,
              fontSize: 21,
              fontFamily: "Overpass",
              letterSpacing: 0,
            ),
          ),
        ],
      )),
    );
  }
}
