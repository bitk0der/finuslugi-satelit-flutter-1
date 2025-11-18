import 'package:equatable/equatable.dart';
import 'package:hive_ce_flutter/adapters.dart';

part 'meta_model.g.dart'; // This is for the generated file

@HiveType(typeId: 2)
class MetaModel extends Equatable {
  @HiveField(0)
  final int activationsCount;
  @HiveField(1)
  final String? goodsCompilation;

  const MetaModel({
    required this.activationsCount,
    required this.goodsCompilation,
  });

  MetaModel.fromJson(Map<String, dynamic> json)
      : activationsCount = json['activationsCount'],
        goodsCompilation = json['goodsCompilation'];

  Map<String, dynamic> toJson() => {
        'activationsCount': activationsCount,
        'goodsCompilation': goodsCompilation,
      };

  @override
  List<Object?> get props => [activationsCount, goodsCompilation];
}
