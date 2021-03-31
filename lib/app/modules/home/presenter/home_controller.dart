import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/consts/network_config.dart';
import '../../../../core/failures/failures.dart';
import '../domain/entities/patient.dart';
import '../domain/entities/search_by_enum.dart';
import '../domain/usecases/get_patients_usecase.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final GetPatientsUsecase _getPatientsUsecase;
  final _seed = NetworkConfig.seed;
  final _results = NetworkConfig.pageResults;
  int _page;
  final double _cardHeight = 148;
  double get cardHeight => _cardHeight;

  String _searchText;

  @observable
  SearchByEnum _searchByEnum;

  @computed
  SearchByEnum get searchByEnum => _searchByEnum;

  @action
  setSearchFilter(SearchByEnum value) {
    _searchByEnum = value;
    onSearchTextChanged(_searchText);
  }

  @observable
  String _genderFilter;

  @computed
  String get genderFilter => _genderFilter;

  @action
  setGenderFilter(String value) => _genderFilter = value;

  @action
  resetGenderFilter() => _genderFilter = "";

  @observable
  TextEditingController _textEditingController;

  @computed
  TextEditingController get textEditingController => _textEditingController;

  @action
  clearTextEditingController() => _textEditingController.clear();

  @observable
  ObservableList<Patient> _searchResult;

  @computed
  ObservableList<Patient> get searchResult => _searchResult;

  @action
  addSearchResult(Patient value) => _searchResult.add(value);

  @action
  clearSearchResult() {
    _searchResult.clear();
    _searchResult = ObservableList();
  }

  @observable
  ObservableList<Patient> _patients;

  @computed
  ObservableList<Patient> get patients => _patients;

  @action
  clearPatients() {
    _patients.clear();
    _patients = ObservableList();
  }

  @observable
  bool _isLoading;

  @computed
  bool get isLoading => _isLoading;

  @observable
  Failure _error;

  @computed
  Failure get error => _error;

  _HomeControllerBase(this._getPatientsUsecase) {
    _init();
  }

  @action
  Future<void> _init() async {
    _searchText = '';
    _textEditingController = new TextEditingController();
    _error = null;
    _isLoading = false;
    resetGenderFilter();
    _searchByEnum = SearchByEnum.NameSearch;

    _page = 1;
    _patients = ObservableList();
    _searchResult = ObservableList();

    await fetchData();
  }

  @action
  fetchData() async {
    _isLoading = true;
    _error = null;

    Either<Failure, List<Patient>> result =
        await _getPatientsUsecase(_seed, _page, _results);
    result.fold((l) {
      _error = l;
    }, (r) {
      _patients.addAll(r);
    });
    _isLoading = false;
  }

  @action
  Future refreshList() async {
    _page = 1;
    clearPatients();
    clearSearchResult();
    clearTextEditingController();
    resetGenderFilter();
    setSearchFilter(SearchByEnum.NameSearch);
    _searchText = '';
    await fetchData();
  }

  @action
  Future loadNextPage() async {
    _page++;
    await fetchData();
  }

  @action
  Future onSearchTextChanged(String text) async {
    _searchText = text;
    clearSearchResult();
    if (text.isEmpty) {
      return;
    }
    text = text.toLowerCase();
    switch (_searchByEnum) {
      case SearchByEnum.NationalitySearch:
        patients.forEach((patient) {
          if (patient.nat.toLowerCase().contains(text))
            addSearchResult(patient);
        });
        break;

      case SearchByEnum.NameSearch:

      default:
        patients.forEach((patient) {
          if (patient.name.first.toLowerCase().contains(text) ||
              patient.name.last.toLowerCase().contains(text))
            addSearchResult(patient);
        });
        break;
    }
  }

  @action
  applyGenderFilter(List<Patient> list) {
    if (_genderFilter == null || _genderFilter == '') {
      return list;
    } else {
      return list
          .where((element) => element.gender.toLowerCase() == _genderFilter)
          .toList();
    }
  }
}
