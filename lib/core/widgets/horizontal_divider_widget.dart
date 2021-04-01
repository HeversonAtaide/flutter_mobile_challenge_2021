import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';

class HorizontalDividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: AppColors.grey,
      indent: 16,
      endIndent: 16,
      height: 1,
      thickness: 1,
    );
  }
}
