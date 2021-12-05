import 'package:cooll/api/dtos/list_response_dto.dart';

class ProductDto {
  final int id;
  final int year;
  final String name;
  final double mileage;
  final double? engineCapacity;
  final double price;
  final List<String> images;

  ProductDto({
    required this.id,
    required this.year,
    required this.name,
    required this.mileage,
    this.engineCapacity,
    required this.price,
    required this.images,
  });

  ProductDto.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        year = json['year'],
        name = json['name'],
        mileage = json['mileage'].toDouble(),
        engineCapacity = json['engineCapacity']?.toDouble(),
        price = json['price'].toDouble(),
        images = json['images'].cast<String>();
}

class ProductsListResponseDto extends ListResponseDto<ProductDto> {
  @override
  List<ProductDto> results;

  ProductsListResponseDto.fromJson(Map<String, dynamic> json)
      : results =
            (json['data'] as List).map((p) => ProductDto.fromJson(p)).toList(),
        super.fromJson(json);
}
