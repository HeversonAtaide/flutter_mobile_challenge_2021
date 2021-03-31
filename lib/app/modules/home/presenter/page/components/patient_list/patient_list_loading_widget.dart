import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../../core/themes/app_colors.dart';
import '../../../home_controller.dart';

class PatientListLoadingWidget extends StatefulWidget {
  @override
  _PatientListLoadingWidgetState createState() =>
      _PatientListLoadingWidgetState();
}

class _PatientListLoadingWidgetState extends State<PatientListLoadingWidget> {
  HomeController _homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: AppColors.grey,
                highlightColor: AppColors.primaryBlue,
                child: Column(
                  children: [
                    Container(
                      height: _homeController.cardHeight,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.green)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 16),
                                child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: new BoxDecoration(
                                    color: AppColors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, top: 16, right: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 18,
                                            width: 36,
                                            decoration: BoxDecoration(
                                              color: AppColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          Container(
                                            height: 24,
                                            width: 148,
                                            decoration: BoxDecoration(
                                              color: AppColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 24,
                                            width: 56,
                                            decoration: BoxDecoration(
                                              color: AppColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                          Container(
                                            height: 24,
                                            width: 96,
                                            decoration: BoxDecoration(
                                              color: AppColors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 18,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          color: AppColors.grey,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Container(
                              height: 18,
                              width: 128,
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}
