// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<GetPatientsUsecase>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<SearchByEnum> _$searchByEnumComputed;

  @override
  SearchByEnum get searchByEnum => (_$searchByEnumComputed ??=
          Computed<SearchByEnum>(() => super.searchByEnum,
              name: '_HomeControllerBase.searchByEnum'))
      .value;
  Computed<String> _$genderFilterComputed;

  @override
  String get genderFilter =>
      (_$genderFilterComputed ??= Computed<String>(() => super.genderFilter,
              name: '_HomeControllerBase.genderFilter'))
          .value;
  Computed<TextEditingController> _$textEditingControllerComputed;

  @override
  TextEditingController get textEditingController =>
      (_$textEditingControllerComputed ??= Computed<TextEditingController>(
              () => super.textEditingController,
              name: '_HomeControllerBase.textEditingController'))
          .value;
  Computed<ObservableList<Patient>> _$searchResultComputed;

  @override
  ObservableList<Patient> get searchResult => (_$searchResultComputed ??=
          Computed<ObservableList<Patient>>(() => super.searchResult,
              name: '_HomeControllerBase.searchResult'))
      .value;
  Computed<ObservableList<Patient>> _$patientsComputed;

  @override
  ObservableList<Patient> get patients => (_$patientsComputed ??=
          Computed<ObservableList<Patient>>(() => super.patients,
              name: '_HomeControllerBase.patients'))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_HomeControllerBase.isLoading'))
          .value;
  Computed<Failure> _$errorComputed;

  @override
  Failure get error => (_$errorComputed ??= Computed<Failure>(() => super.error,
          name: '_HomeControllerBase.error'))
      .value;

  final _$_searchByEnumAtom = Atom(name: '_HomeControllerBase._searchByEnum');

  @override
  SearchByEnum get _searchByEnum {
    _$_searchByEnumAtom.reportRead();
    return super._searchByEnum;
  }

  @override
  set _searchByEnum(SearchByEnum value) {
    _$_searchByEnumAtom.reportWrite(value, super._searchByEnum, () {
      super._searchByEnum = value;
    });
  }

  final _$_genderFilterAtom = Atom(name: '_HomeControllerBase._genderFilter');

  @override
  String get _genderFilter {
    _$_genderFilterAtom.reportRead();
    return super._genderFilter;
  }

  @override
  set _genderFilter(String value) {
    _$_genderFilterAtom.reportWrite(value, super._genderFilter, () {
      super._genderFilter = value;
    });
  }

  final _$_textEditingControllerAtom =
      Atom(name: '_HomeControllerBase._textEditingController');

  @override
  TextEditingController get _textEditingController {
    _$_textEditingControllerAtom.reportRead();
    return super._textEditingController;
  }

  @override
  set _textEditingController(TextEditingController value) {
    _$_textEditingControllerAtom
        .reportWrite(value, super._textEditingController, () {
      super._textEditingController = value;
    });
  }

  final _$_searchResultAtom = Atom(name: '_HomeControllerBase._searchResult');

  @override
  ObservableList<Patient> get _searchResult {
    _$_searchResultAtom.reportRead();
    return super._searchResult;
  }

  @override
  set _searchResult(ObservableList<Patient> value) {
    _$_searchResultAtom.reportWrite(value, super._searchResult, () {
      super._searchResult = value;
    });
  }

  final _$_patientsAtom = Atom(name: '_HomeControllerBase._patients');

  @override
  ObservableList<Patient> get _patients {
    _$_patientsAtom.reportRead();
    return super._patients;
  }

  @override
  set _patients(ObservableList<Patient> value) {
    _$_patientsAtom.reportWrite(value, super._patients, () {
      super._patients = value;
    });
  }

  final _$_isLoadingAtom = Atom(name: '_HomeControllerBase._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  final _$_errorAtom = Atom(name: '_HomeControllerBase._error');

  @override
  Failure get _error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  set _error(Failure value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('_HomeControllerBase._init');

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$fetchDataAsyncAction = AsyncAction('_HomeControllerBase.fetchData');

  @override
  Future fetchData() {
    return _$fetchDataAsyncAction.run(() => super.fetchData());
  }

  final _$refreshListAsyncAction =
      AsyncAction('_HomeControllerBase.refreshList');

  @override
  Future<dynamic> refreshList() {
    return _$refreshListAsyncAction.run(() => super.refreshList());
  }

  final _$loadNextPageAsyncAction =
      AsyncAction('_HomeControllerBase.loadNextPage');

  @override
  Future<dynamic> loadNextPage() {
    return _$loadNextPageAsyncAction.run(() => super.loadNextPage());
  }

  final _$onSearchTextChangedAsyncAction =
      AsyncAction('_HomeControllerBase.onSearchTextChanged');

  @override
  Future<dynamic> onSearchTextChanged(String text) {
    return _$onSearchTextChangedAsyncAction
        .run(() => super.onSearchTextChanged(text));
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic setSearchFilter(SearchByEnum value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSearchFilter');
    try {
      return super.setSearchFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGenderFilter(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setGenderFilter');
    try {
      return super.setGenderFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetGenderFilter() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.resetGenderFilter');
    try {
      return super.resetGenderFilter();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearTextEditingController() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearTextEditingController');
    try {
      return super.clearTextEditingController();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addSearchResult(Patient value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.addSearchResult');
    try {
      return super.addSearchResult(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearSearchResult() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearSearchResult');
    try {
      return super.clearSearchResult();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearPatients() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearPatients');
    try {
      return super.clearPatients();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic applyGenderFilter(List<Patient> list) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.applyGenderFilter');
    try {
      return super.applyGenderFilter(list);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchByEnum: ${searchByEnum},
genderFilter: ${genderFilter},
textEditingController: ${textEditingController},
searchResult: ${searchResult},
patients: ${patients},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
