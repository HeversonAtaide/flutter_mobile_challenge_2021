import 'package:flutter/material.dart';

import '../../../../../../../core/themes/app_colors.dart';

class SearchBarErrorWidget extends StatefulWidget {
  @override
  _SearchBarErrorWidgetState createState() => _SearchBarErrorWidgetState();
}

class _SearchBarErrorWidgetState extends State<SearchBarErrorWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: new Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: new Card(
                child: new ListTile(
                  title: Container(
                    height: 18,
                    width: 24,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 56,
              width: 56,
              child: Icon(
                Icons.filter_alt,
                color: AppColors.grey,
                size: 56,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
