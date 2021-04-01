import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';

import '../../../../../core/screen_utils.dart';

class IconButtonMaps extends StatelessWidget {
  final Widget image;
  final String title;
  final Function onTap;

  const IconButtonMaps({
    Key key,
    this.image,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.green),
            borderRadius: BorderRadius.circular(5.0),
            color: AppColors.white,
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: ScreenUtils.blockSizeHorizontal * 15,
                width: ScreenUtils.blockSizeHorizontal * 15,
                child: image,
              ),
              SizedBox(
                height: ScreenUtils.blockSizeVertical,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: onTap,
            ),
          ),
        )
      ],
    );
  }
}
