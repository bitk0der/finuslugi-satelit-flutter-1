import 'package:json_annotation/json_annotation.dart';
part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  @JsonKey(name: 'items')
  final List<Map<String, dynamic>> items;
  final Pagination pagination;

  ResponseData(this.items, this.pagination);

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class Pagination {
  @JsonKey(name: 'current_page')
  final int page;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final int total;

  Pagination(this.page, this.totalPages, this.total);

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
