import 'package:cooll/api/dtos/product_dto.dart';
import 'package:cooll/stores/home_view_store/home_view_store.dart';
import 'package:cooll/theme/app_dimens.dart';
import 'package:cooll/views/first_page_error_view.dart';
import 'package:cooll/views/first_page_loading_view.dart';
import 'package:cooll/views/new_page_error_view.dart';
import 'package:cooll/views/new_page_loading_view.dart';
import 'package:cooll/views/no_data_view.dart';
import 'package:cooll/views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final store = HomeViewStore();
  final PagingController<int, ProductDto> _controller =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();

    _controller.addPageRequestListener(store.getProducts);

    store.addReaction(
      reaction<ProductsListResponseDto?>(
        (_) => store.pagedStore.data,
        (data) {
          if (data == null) return;
          _controller.value = PagingState(
            nextPageKey: store.pagedStore.nextPageKey,
            error: null,
            itemList: data.results,
          );
        },
      ),
    );

    store.addReaction(
      reaction<Exception?>(
        (_) => store.pagedStore.error,
        (error) {
          if (error == null) return;
          _controller.value = PagingState(
            nextPageKey: store.pagedStore.nextPageKey,
            error: error,
            itemList: store.pagedStore.data?.results,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
            top: AppDimens.screenHorizontalPadding,
            left: AppDimens.screenHorizontalPadding,
            right: AppDimens.screenHorizontalPadding,
          ),
          sliver: PagedSliverGrid<int, ProductDto>(
            showNewPageProgressIndicatorAsGridChild: false,
            showNewPageErrorIndicatorAsGridChild: false,
            showNoMoreItemsIndicatorAsGridChild: false,
            pagingController: _controller,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.73,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
            ),
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (_, product, index) => ProductCard(product: product),
              noItemsFoundIndicatorBuilder: (_) => const NoDataView(),
              firstPageProgressIndicatorBuilder: (_) =>
                  const FirstPageLoadingView(),
              newPageProgressIndicatorBuilder: (_) =>
                  const NewPageLoadingView(),
              firstPageErrorIndicatorBuilder: (_) => FirstPageErrorView(
                onTryAgain: _controller.retryLastFailedRequest,
              ),
              newPageErrorIndicatorBuilder: (_) => NewPageErrorView(
                onTryAgain: _controller.retryLastFailedRequest,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    store.dispose();
    super.dispose();
  }
}
