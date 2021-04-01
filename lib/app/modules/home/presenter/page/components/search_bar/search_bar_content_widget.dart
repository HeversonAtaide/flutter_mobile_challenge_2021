import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../core/themes/app_colors.dart';
import '../../../../../../../core/widgets/horizontal_divider_widget.dart';
import '../../../home_controller.dart';
import '../../../../domain/entities/search_by_enum.dart';

class SearchBarContentWidget extends StatefulWidget {
  @override
  _SearchBarContentWidgetState createState() => _SearchBarContentWidgetState();
}

class _SearchBarContentWidgetState extends State<SearchBarContentWidget> {
  HomeController _homeController = Modular.get<HomeController>();

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
                  leading: new Icon(Icons.search),
                  title: new TextField(
                    controller: _homeController.textEditingController,
                    decoration: new InputDecoration(
                        hintText: 'Searching', border: InputBorder.none),
                    onChanged: _homeController.onSearchTextChanged,
                  ),
                  // trailing: new IconButton(
                  //   icon: new Icon(Icons.cancel),
                  //   onPressed: () async {
                  //     _homeController.clearTextEditingController();
                  //     await onSearchTextChanged('');
                  //   },
                  // ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                FocusScope.of(context).unfocus();
                _settingModalBottomSheet(context);
              },
              child: Container(
                height: 56,
                width: 56,
                child: Icon(
                  Icons.filter_alt,
                  color: AppColors.green,
                  size: 56,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Observer(
            builder: (_) {
              return Wrap(
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter by:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontSize: 21,
                              fontFamily: "Overpass",
                              letterSpacing: 0),
                        ),
                        IconButton(
                          icon: new Icon(
                            Icons.close,
                            color: AppColors.green,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _homeController.setGenderFilter('');
                    },
                    child: ListTile(
                      title: Text(
                        'No filter',
                      ),
                      leading: Radio(
                          value: '',
                          groupValue: _homeController.genderFilter,
                          activeColor: AppColors.green,
                          onChanged: (_) {}),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _homeController.setGenderFilter('female');
                    },
                    child: ListTile(
                      title: Text(
                        'Female',
                      ),
                      leading: Radio(
                          value: 'female',
                          groupValue: _homeController.genderFilter,
                          activeColor: AppColors.green,
                          onChanged: (_) {}),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _homeController.setGenderFilter('male');
                    },
                    child: ListTile(
                      title: Text(
                        'Male',
                      ),
                      leading: Radio(
                          value: 'male',
                          groupValue: _homeController.genderFilter,
                          activeColor: AppColors.green,
                          onChanged: (_) {}),
                    ),
                  ),
                  HorizontalDividerWidget(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, top: 16, right: 16),
                    child: Text(
                      'Search by:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 21,
                          fontFamily: "Overpass",
                          letterSpacing: 0),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _homeController.setSearchFilter(SearchByEnum.NameSearch);
                    },
                    child: ListTile(
                      title: Text(
                        'Name',
                      ),
                      leading: Radio(
                          value: SearchByEnum.NameSearch,
                          groupValue: _homeController.searchByEnum,
                          activeColor: AppColors.green,
                          onChanged: (_) {}),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _homeController
                          .setSearchFilter(SearchByEnum.NationalitySearch);
                    },
                    child: ListTile(
                      title: Text(
                        'Nationality',
                      ),
                      leading: Radio(
                          value: SearchByEnum.NationalitySearch,
                          groupValue: _homeController.searchByEnum,
                          activeColor: AppColors.green,
                          onChanged: (_) {}),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
