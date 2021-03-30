// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SplashScreenController = BindInject(
  (i) => SplashScreenController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashScreenController on _SplashScreenControllerBase, Store {
  final _$valueAtom = Atom(name: '_SplashScreenControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_SplashScreenControllerBaseActionController =
      ActionController(name: '_SplashScreenControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SplashScreenControllerBaseActionController
        .startAction(name: '_SplashScreenControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SplashScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
