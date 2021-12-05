// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagedStore<T extends ListResponseDto<dynamic>>
    on PagedStoreBased<T>, Store {
  Computed<int?>? _$nextPageKeyComputed;

  @override
  int? get nextPageKey =>
      (_$nextPageKeyComputed ??= Computed<int?>(() => super.nextPageKey,
              name: 'PagedStoreBased.nextPageKey'))
          .value;

  final _$dataAtom = Atom(name: 'PagedStoreBased.data');

  @override
  T? get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(T? value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$errorAtom = Atom(name: 'PagedStoreBased.error');

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$pageKeyAtom = Atom(name: 'PagedStoreBased.pageKey');

  @override
  int get pageKey {
    _$pageKeyAtom.reportRead();
    return super.pageKey;
  }

  @override
  set pageKey(int value) {
    _$pageKeyAtom.reportWrite(value, super.pageKey, () {
      super.pageKey = value;
    });
  }

  final _$getDataPageAsyncAction = AsyncAction('PagedStoreBased.getDataPage');

  @override
  Future<dynamic> getDataPage(
      {required PagedRepoFunction<T> request, required int pageKey}) {
    return _$getDataPageAsyncAction
        .run(() => super.getDataPage(request: request, pageKey: pageKey));
  }

  @override
  String toString() {
    return '''
data: ${data},
error: ${error},
pageKey: ${pageKey},
nextPageKey: ${nextPageKey}
    ''';
  }
}
