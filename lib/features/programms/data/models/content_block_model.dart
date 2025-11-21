import 'package:hive_ce_flutter/adapters.dart';
part 'content_block_model.g.dart';

@HiveType(typeId: 27)
class ContentBlock {
  @HiveField(0)
  final String type;
  @HiveField(1)
  final String data;

  ContentBlock({
    required this.type,
    required this.data,
  });

  factory ContentBlock.fromJson(Map<String, dynamic> json) {
    return ContentBlock(
      type: json['type'] ?? '',
      data: json['data'] ?? '',
    );
  }
}
