// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigation_bar_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BottomNavigationBarController = BindInject(
  (i) => BottomNavigationBarController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigationBarController
    on _BottomNavigationBarControllerBase, Store {
  Computed<int> _$currentPageComputed;

  @override
  int get currentPage =>
      (_$currentPageComputed ??= Computed<int>(() => super.currentPage,
              name: '_BottomNavigationBarControllerBase.currentPage'))
          .value;

  final _$_currentPageAtom =
      Atom(name: '_BottomNavigationBarControllerBase._currentPage');

  @override
  int get _currentPage {
    _$_currentPageAtom.reportRead();
    return super._currentPage;
  }

  @override
  set _currentPage(int value) {
    _$_currentPageAtom.reportWrite(value, super._currentPage, () {
      super._currentPage = value;
    });
  }

  final _$_initAsyncAction =
      AsyncAction('_BottomNavigationBarControllerBase._init');

  @override
  Future<void> _init() {
    return _$_initAsyncAction.run(() => super._init());
  }

  final _$_BottomNavigationBarControllerBaseActionController =
      ActionController(name: '_BottomNavigationBarControllerBase');

  @override
  void setCurrentPage(int value) {
    final _$actionInfo = _$_BottomNavigationBarControllerBaseActionController
        .startAction(name: '_BottomNavigationBarControllerBase.setCurrentPage');
    try {
      return super.setCurrentPage(value);
    } finally {
      _$_BottomNavigationBarControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentPage: ${currentPage}
    ''';
  }
}
