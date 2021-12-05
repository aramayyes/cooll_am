import 'package:cooll/api/dtos/meta_dto.dart';

abstract class ListResponseDto<T> {
  MetaDto? meta;
  abstract List<T> results;

  ListResponseDto(
    this.meta,
    List<T> results,
  );

  ListResponseDto.fromJson(Map<String, dynamic> json)
      : meta = json['meta'] != null ? MetaDto.fromJson(json['meta']) : null;

  void addPreviousResults(List<T> results) {
    this.results = results..addAll(this.results);
  }
}
