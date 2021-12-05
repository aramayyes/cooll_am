class MetaDto {
  final int total;

  MetaDto(this.total);

  MetaDto.fromJson(Map<String, dynamic> json)
      : total = json['pagination']['total'];
}
