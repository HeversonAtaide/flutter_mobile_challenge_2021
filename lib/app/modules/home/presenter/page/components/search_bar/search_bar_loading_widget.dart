import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/themes/app_colors.dart';

class SearchBarLoadingWidget extends StatefulWidget {
  @override
  _SearchBarLoadingWidgetState createState() => _SearchBarLoadingWidgetState();
}

class _SearchBarLoadingWidgetState extends State<SearchBarLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: new Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Shimmer.fromColors(
          baseColor: AppColors.grey,
          highlightColor: AppColors.primaryBlue,
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
      ),
    );
  }
}
