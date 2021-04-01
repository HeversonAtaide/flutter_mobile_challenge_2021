import 'package:flutter/material.dart';

import '../failures/failures.dart';
import '../themes/app_colors.dart';

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
              _error.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.grey,
                fontSize: 21,
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
                      fontSize: 18,
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
