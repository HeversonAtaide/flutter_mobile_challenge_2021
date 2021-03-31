import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge_2021/app/modules/home/presenter/home_controller.dart';
import 'package:flutter_mobile_challenge_2021/core/themes/app_colors.dart';
import 'package:flutter_mobile_challenge_2021/core/utils.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
            setState(() {});
          },
          backgroundColor: AppColors.white,
          color: AppColors.green,
          child: ListView.separated(
              controller: scrollController,
              itemCount: _homeController.patients.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 8,
                );
              },
              itemBuilder: (context, index) {
                scrollController.addListener(() async {
                  if ((scrollController.position.pixels +
                          _homeController.cardHeight) >=
                      scrollController.position.maxScrollExtent) {
                    if (!_homeController.isLoading) {
                      await _homeController.loadNextPage();
                      setState(() {});
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
                                                _homeController.patients[index]
                                                    .picture.large))),
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
                                              _homeController
                                                  .patients[index].name.title,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.grey,
                                                fontSize: 15,
                                                fontFamily: "Overpass",
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            Text(
                                              '${_homeController.patients[index].name.first} ${_homeController.patients[index].name.last}',
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
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              _homeController
                                                  .patients[index].gender,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: AppColors.primaryBlue,
                                                fontSize: 17,
                                                fontFamily: "Overpass",
                                                letterSpacing: 0,
                                              ),
                                            ),
                                            Text(
                                              Utils.formatDate(_homeController
                                                  .patients[index].dob.date),
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
                        visible: index == _homeController.patients.length - 1,
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
              }),
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
}
