import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../core/consts/network_config.dart';
import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/utils.dart';
import '../../../../domain/entities/patient.dart';
import '../../../home_controller.dart';
import 'patient_list_empty_widget.dart';

class PatientListContentWidget extends StatefulWidget {
  @override
  _PatientListContentWidgetState createState() =>
      _PatientListContentWidgetState();
}

class _PatientListContentWidgetState extends State<PatientListContentWidget> {
  HomeController _homeController = Modular.get<HomeController>();
  ScrollController scrollController = new ScrollController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Stack(
      children: [
        RefreshIndicator(
          onRefresh: () async {
            await _homeController.refreshList();
            //setState(() {});
          },
          backgroundColor: AppColors.white,
          color: AppColors.green,
          child: Observer(
            builder: (_) {
              _homeController.genderFilter;
              _homeController.searchByEnum;
              return _homeController.searchResult.length != 0 ||
                      _homeController.textEditingController.text.isNotEmpty
                  ? _buildList(_homeController.searchResult, false)
                  : _buildList(_homeController.patients, true);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 16),
          child: Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                scrollController.animateTo(
                  0.0,
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                );
              },
              child: Container(
                height: 56,
                width: 56,
                decoration: new BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_upward,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildList(List<Patient> list, bool canLoadmore) {
    List<Patient> filteredList = _homeController.applyGenderFilter(list);
    if (filteredList.isNotEmpty &&
        filteredList.length < NetworkConfig.pageResults) {
      _homeController.loadNextPage();
    }
    return filteredList.isEmpty
        ? PatientListEmptyWidget()
        : ListView.separated(
            controller: scrollController,
            itemCount: filteredList.length,
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              scrollController.addListener(() async {
                if ((scrollController.position.pixels +
                            _homeController.cardHeight) >=
                        scrollController.position.maxScrollExtent &&
                    canLoadmore) {
                  if (!_homeController.isLoading) {
                    await _homeController.loadNextPage();
                    //setState(() {});
                  }
                }
              });

              return Column(
                children: [
                  DelayedDisplay(
                    slidingBeginOffset: Offset(0.35, 0),
                    delay: Duration(milliseconds: 100),
                    child: Container(
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
                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new NetworkImage(
                                              filteredList[index]
                                                  .picture
                                                  .large))),
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
                                          Text(
                                            filteredList[index].name.title,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 15,
                                              fontFamily: "Overpass",
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          Text(
                                            '${filteredList[index].name.first} ${filteredList[index].name.last}',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryBlue,
                                              fontSize: 21,
                                              fontFamily: "Overpass",
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            filteredList[index].gender,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryBlue,
                                              fontSize: 17,
                                              fontFamily: "Overpass",
                                              letterSpacing: 0,
                                            ),
                                          ),
                                          Text(
                                            Utils.formatDate(
                                                filteredList[index].dob.date),
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: AppColors.primaryBlue,
                                              fontSize: 17,
                                              fontFamily: "Overpass",
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        filteredList[index].nat,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          color: AppColors.primaryBlue,
                                          fontSize: 17,
                                          fontFamily: "Overpass",
                                          letterSpacing: 0,
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
                            child: Text(
                              'See details',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 17,
                                fontFamily: "Overpass",
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                      visible: index == filteredList.length - 1 && canLoadmore,
                      child: Container(
                        height: 148,
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  AppColors.green),
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
                      ))
                ],
              );
            });
  }

  
}
