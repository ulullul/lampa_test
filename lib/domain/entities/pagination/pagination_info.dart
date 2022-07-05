import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class PaginationInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const PaginationInfo({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });
}
