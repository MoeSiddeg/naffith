import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_response_body.freezed.dart';
part 'category_response_body.g.dart';

@freezed
class CategoryResponseBody with _$CategoryResponseBody  {
  const factory CategoryResponseBody({
    required List<CategoryData> data,
    required Links links,
    required Meta meta,
  }) = _CategoryResponseBody ;

  factory CategoryResponseBody.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseBodyFromJson(json);
}

@freezed
class CategoryData with _$CategoryData {
  const factory CategoryData({
    required int id,
    required String name,
  }) = _CategoryData;

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    required String first,
    required String last,
    required String? prev,
    required String? next,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required int current_page,
    required int from,
    required int last_page,
    required List<Link> links,
    required String path,
    required int per_page,
    required int to,
    required int total,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Link with _$Link {
  const factory Link({
    required String? url,
    required String label,
    required bool active,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
