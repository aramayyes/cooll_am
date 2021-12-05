import 'package:cooll/api/dtos/list_response_dto.dart';
import 'package:cooll/constants/ui_constants.dart';
import 'package:cooll/stores/store_mixin.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

part 'paged_store.g.dart';

typedef PagedRepoFunction<T> = Future<T> Function({
  required int page,
  required int limit,
  required int offset,
});

class PagedStore<T extends ListResponseDto> = PagedStoreBased<T>
    with _$PagedStore<T>, StoreMixin;

abstract class PagedStoreBased<T extends ListResponseDto> with Store {
  @observable
  T? data;

  @observable
  Exception? error;

  @observable
  int pageKey = 1;

  final int limit;

  PagedStoreBased({this.limit = UIConstants.pagedListLimit});

  @computed
  int? get nextPageKey => data?.meta?.total != null &&
          data!.meta!.total > pageKey * UIConstants.pagedListLimit
      ? pageKey + 1
      : null;

  @action
  Future getDataPage({
    required PagedRepoFunction<T> request,
    required int pageKey,
  }) async {
    try {
      final resultDto = await request(
        page: pageKey,
        limit: limit,
        offset: (pageKey - 1) * UIConstants.pagedListLimit,
      );

      var prevResults = data?.results;
      if (pageKey != 1 && prevResults != null) {
        resultDto.addPreviousResults(prevResults);
      }

      error = null;
      data = resultDto;
      this.pageKey = pageKey;
    } on DioError catch (err) {
      if (CancelToken.isCancel(err)) {
        return;
      }

      error = err;
    } on Exception catch (err) {
      error = err;
    }
  }
}
