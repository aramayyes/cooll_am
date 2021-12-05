import 'package:cooll/api/dio_client.dart';
import 'package:cooll/api/dtos/product_dto.dart';

class ProductsRepository {
  static const _getProducts = 'products/filter';

  static Future<ProductsListResponseDto> getProducts({
    required int page,
    required int limit,
    required int offset,
  }) async {
    final client = DioClient.getClient();
    final response = await client.get(_getProducts, queryParameters: {
      'limit': limit,
      'page': page - 1,
    });

    return ProductsListResponseDto.fromJson(response.data);
  }
}
