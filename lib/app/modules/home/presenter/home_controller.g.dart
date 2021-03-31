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
  Computed<List<Patient>> _$patientsComputed;

  @override
  List<Patient> get patients =>
      (_$patientsComputed ??= Computed<List<Patient>>(() => super.patients,
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

  final _$_patientsAtom = Atom(name: '_HomeControllerBase._patients');

  @override
  List<Patient> get _patients {
    _$_patientsAtom.reportRead();
    return super._patients;
  }

  @override
  set _patients(List<Patient> value) {
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

  @override
  String toString() {
    return '''
patients: ${patients},
isLoading: ${isLoading},
error: ${error}
    ''';
  }
}
