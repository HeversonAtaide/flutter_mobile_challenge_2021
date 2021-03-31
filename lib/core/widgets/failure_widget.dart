import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/core/failures/failures.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FailureWidget extends StatelessWidget {
  final Failure _error;
  final Function _action;

  const FailureWidget(
    this._error,
    this._action,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _error is NoInternetConnection
                  ? 'No internet'
                  : _error.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 14,
                fontFamily: "Overpass",
                letterSpacing: 0,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            InkWell(
              child: Container(
                height: 56,
                width: 240,
                child: Center(
                  child: Text(
                    'Try again',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.green,
                      fontSize: 14,
                      fontFamily: "Overpass",
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              onTap: _action,
            )
          ],
        ),
      ),
    );
  }
}
