import 'package:json_annotation/json_annotation.dart';
import 'package:rnm_t/domain/entities/pagination/pagination_info.dart';

part 'pagination_info_model.g.dart';

@JsonSerializable()
class PaginationInfoModel extends PaginationInfo {
  const PaginationInfoModel({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) : super(
          count: count,
          pages: pages,
          next: next,
          prev: prev,
        );

  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationInfoModelToJson(this);
}
