// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'root_home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RootHomeScreenStore on RootHomeScreenStoreBase, Store {
  final _$activeIndexAtom = Atom(name: 'RootHomeScreenStoreBase.activeIndex');

  @override
  int get activeIndex {
    _$activeIndexAtom.reportRead();
    return super.activeIndex;
  }

  @override
  set activeIndex(int value) {
    _$activeIndexAtom.reportWrite(value, super.activeIndex, () {
      super.activeIndex = value;
    });
  }

  final _$RootHomeScreenStoreBaseActionController =
      ActionController(name: 'RootHomeScreenStoreBase');

  @override
  void changeIndex(int newIndex) {
    final _$actionInfo = _$RootHomeScreenStoreBaseActionController.startAction(
        name: 'RootHomeScreenStoreBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$RootHomeScreenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeIndex: ${activeIndex}
    ''';
  }
}
