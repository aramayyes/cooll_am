import 'package:cooll/api/dio_client.dart';
import 'package:cooll/api/dtos/product_dto.dart';

class ProductsRepository {
  static const _topPicks = 'products/type/top';

  static Future<ProductsListResponseDto> getTopProducts({
    required int limit,
    required int offset,
  }) async {
    final client = DioClient.getClient();
    final response = await client.get(_topPicks, queryParameters: {
      'limit': limit,
      'offset': offset,
    });

    return ProductsListResponseDto.fromJson(response.data);
  }
}
