import 'package:cooll/api/dtos/product_dto.dart';
import 'package:cooll/api/repositories/products_repository.dart';
import 'package:cooll/stores/paged_store/paged_store.dart';
import 'package:cooll/stores/store_mixin.dart';
import 'package:mobx/mobx.dart';

part 'home_view_store.g.dart';

class HomeViewStore = HomeViewStoreBase with _$HomeViewStore, StoreMixin;

abstract class HomeViewStoreBase with Store {
  final pagedStore = PagedStore<ProductsListResponseDto>();

  void getProducts(int pageKey) {
    pagedStore.getDataPage(
      request: ({required int page, required int limit, required int offset}) =>
          ProductsRepository.getProducts(
        page: page,
        limit: limit,
        offset: offset,
      ),
      pageKey: pageKey,
    );
  }
}
